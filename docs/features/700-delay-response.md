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
          delay: 
            min: 500 # milliseconds
            max: 2000 # milliseconds
```

```curl
time curl http://127.0.0.1:3000/hello
# Hello World
# curl http://127.0.0.1:3000/hello  0.00s user 0.00s system 1% cpu 0.578 total

time curl http://127.0.0.1:3000/hello
# Hello World
# curl http://127.0.0.1:3000/hello  0.00s user 0.01s system 0% cpu 1.958 total
```
