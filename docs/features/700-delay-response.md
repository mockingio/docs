---
sidebar_position: 700
---

# Delay response

```yaml title="delay.yaml"
name: Example of mock server with delay response for 3 seconds
port: 3000
routes:
    - path: /hello
      responses:
        - body: "Hello World"
          delay: 3000 # 3 seconds
```

```curl
time curl http://127.0.0.1:50692/hello
# Hello World
# curl http://127.0.0.1:50692/hello  0.00s user 0.01s system 0% cpu 3.017 total
```
