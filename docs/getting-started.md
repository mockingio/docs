---
sidebar_position: 10
---

# Getting Started

## Installation

### Homebrew

```bash
brew tap mockingio/mockingio-tap
brew install mockingio/mockingio-tap/mockingio
```

### Go install

```bash
go install github.com/mockingio/mockingio@latest
```

### Docker hub

```bash
docker pull mockingio/mockingio
docker run -ti mockingio/mockingio --version
```

### Build from source

```bash
# Clone the source code
git clone https://github.com/mockingio/mockingio.git
cd mockingio
go build .
```

## Start mock server

### Create a simple mock file

```yaml
# file: mock.yml
name: Hello World
port: 8080
routes:
  - path: /hello-world
    responses:
      - body: |
          Greeting from mocking.io!
```

Start the mock server

```bash
mockingio start --filename mock.yml
```

This will start a mock server, listing at port :8080. 

```bash
curl 127.0.0.1:8080
# Greeting from mocking.io!
```
