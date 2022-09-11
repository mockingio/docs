---
sidebar_position: 5
---

# Installation

## Homebrew

```bash
brew tap mockingio/mockingio-tap
brew install mockingio/mockingio-tap/mockingio
```

## Go install

```bash
go install github.com/mockingio/mockingio@latest
```

## Docker hub

```bash
docker pull mockingio/mockingio
docker run -ti mockingio/mockingio --version
```

## Build from source

```bash
# Clone the source code
git clone https://github.com/mockingio/mockingio.git
cd mockingio
go build .
```
