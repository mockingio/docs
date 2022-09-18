---
sidebar_position: 900
---

# Using the Go package

Go package: github.com/mockingio/mockingio/pkg/mock

If your application is written in Go, you can take the benefit of using the Go package to create your mock server. For example:

## Simple mock server

```go title="simple mock server"
package main

import (
  "github.com/mockingio/mockingio/pkg/mock"
)

func main() {
  // Create mock server
  srv, err := mock.New().
    Get("/hello").
    Response(http.StatusOK, "hello world").
    Start()
  defer srv.Close()

  fmt.Println("mock is serving at: " + srv.URL)
}
```

## Mock server with rules

```go title="Create mock server with rules "
package main

import (
  "github.com/mockingio/mockingio/pkg/mock"
)

func main() {
  // Create mock server
  srv, err := New().
    Get("/hello").
    Response(http.StatusOK, "hello world").
    When(Cookie, "name", Equal, "Chocolate").
    And(Cookie, "brand", Regex, "[a-zA-Z]+").
    And(Header, "x-type", Regex, "yummy").
    Start()

  fmt.Println("mock is serving at: " + srv.URL)
}
```
