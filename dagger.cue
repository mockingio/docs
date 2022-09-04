package main

import (
	"dagger.io/dagger"
	"dagger.io/dagger/core"
	"universe.dagger.io/yarn"
	"universe.dagger.io/docker"
)

dagger.#Plan & {
	client: {
		filesystem: ".": read: {
			contents: dagger.#FS
		}
		commands: {
			"ECR Login": {
				name: "aws"
				args: ["ecr", "get-login-password"]
				stdout: dagger.#Secret
			}

			"kubeconfig": {
				name: "echo"
				args: ["\(env.KUBE_CONFIG)"]
				stdout: dagger.#Secret
			}

			"awsconfig": {
				name: "echo"
				args: ["\(env.AWS_CONFIG)"]
				stdout: dagger.#Secret
			}
		}
		env: {
			ECR_REGISTRY: string
			KUBE_CONFIG:  string
			AWS_CONFIG:   string
		}
	}

	actions: {
		build: {
			// core.#Source lets you access a file system tree (dagger.#FS)
			// using a path at "." or deeper (e.g. "./foo" or "./foo/bar") with
			// optional include/exclude of specific files/directories/globs
			checkoutCode: core.#Source & {
				path: "."
			}
			// Runs a `yarn install` in a container with the source code
			install: yarn.#Install & {
				source: checkoutCode.output
			}
			// Runs a `yarn build` script in a container with the source code
			build: yarn.#Script & {
				source: checkoutCode.output
				name:   "build"
			}
		}

		ecr: docker.#Build & {
			steps: [
				docker.#Dockerfile & {
					source: client.filesystem.".".read.contents
					platforms: ["linux/arm64"]
					dockerfile: "Dockerfile"
				},
			]
		}

		push: docker.#Push & {
			"image": ecr.output
			dest:    client.env.ECR_REGISTRY
			auth: {
				username: "AWS"
				secret:   client.commands."ECR Login".stdout
			}
		}

		deploy: {
			_kubectl: docker.#Build & {
				steps: [
					docker.#Pull & {
						source: "bearengineer/awscli-kubectl"
					},
				]
			}

			_source: core.#Source & {
				path: "."
				include: [".kustomization"]
			}

			docker.#Run & {
				input: _kubectl.output
				command: {
					name: "kubectl"
					args: ["apply", "-k", "/workspace/.kustomization"]
				}
				user: "root"
				mounts: {
					workspace: {
						dest:     "/workspace"
						contents: _source.output
					}
					kubeconfig: {
						dest:     "/root/.kube/config"
						contents: client.commands.kubeconfig.stdout
					}
					awsconfig: {
						dest:     "/root/.aws/credentials"
						contents: client.commands.awsconfig.stdout
					}
				}
				env: HACK: "\(push.result)"
			}
		}
	}
}
