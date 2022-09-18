---
sidebar_position: 950
---

# Run mock server using Docker

```yaml title="/tmp/docker.yaml"
# file: mock.yml
name: Hello World
port: 3000
routes:
  - path: /hello-world
    responses:
      - body: |
          Greeting from mocking.io!
```

```bash
docker pull mockingio/mockingio
docker run -ti -v /tmp:/tmp -p 3000:3000 mockingio/mockingio start --filename /tmp/docker.yaml
```
