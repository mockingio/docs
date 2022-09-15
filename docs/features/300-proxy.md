---
sidebar_position: 20
---
# Proxy

 If no routes match the request, the request will be forwarded to the endpoint specified in the proxy setup.

```yaml title="proxy.yaml"
name: Example of mock server with proxy
port: 3000
proxy:
  enabled: true
  host: https://github.com
  insecure_skip_verify: true
  request_headers:
    X-From: mock
  response_headers:
    X-From: proxy
routes:
    - path: /hello
      responses:
        - body: "Hello World"
```

## Attributes

- **enabled**  Default: `false`. `true` to enable the proxy feature.
- **host** URL to where the request will be forwarded.
- **insecure_skip_verify** Default: `false`, `true` to skip verify TLS.
- **request_headers** These headers will be added to the request headers.
- **response_headers** These response headers will be added to the response headers.
