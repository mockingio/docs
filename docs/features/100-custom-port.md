---
sidebar_position: 100
---

# Use custom port

```yaml title="example.yaml"
name: Example of mock server with custom port
port: 3000
routes:
    - path: /hello
      responses:
        - body: "Hello World"
```

```bash title="CLI"
mockingio start --filename example.yaml
# {"urls":["http://127.0.0.1:3000"]}
# The server is listening at http://127.0.0.1:3000
```

If you don't specify the port, a random available port will be selected.