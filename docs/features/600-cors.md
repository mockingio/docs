---
sidebar_position: 600
---

# Auto CORS

```yaml title="cors.yaml"
name: Example of mock server with auto cors
auto_cors: true
routes:
    - path: /hello
      responses:
        - body: "Hello World"
```

- **auto_cors** Default: `false`. If it is `true`, the OPTIONS requests will be auto response with `Access-Control-Allow-Origin: *`