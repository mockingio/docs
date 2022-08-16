package main

import (
	"dagger.io/dagger"
	"dagger.io/dagger/core"

	"universe.dagger.io/yarn"
	"universe.dagger.io/docker"
)

dagger.#Plan & {
	client: {
		commands: {
			"ECR Login": {
				name: "aws"
				args: ["ecr", "get-login-password"]
				stdout: dagger.#Secret
			}
		}

		env: {
			ECR_REGISTRY: string
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

		image: docker.#Build & {
			steps: [
				docker.#Pull & {
					source: "nginx:alpine"
				},
				docker.#Copy & {
					contents: build."build".output
					dest:     "/usr/share/nginx/html"
				},
			]
		}

		push: docker.#Push & {
			"image": image.output
			dest:    client.env.ECR_REGISTRY
			auth: {
				username: "AWS"
				secret:   client.commands."ECR Login".stdout
			}
		}
	}
}
