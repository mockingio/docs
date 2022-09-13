---
sidebar_position: 25
---

# Mock definition

```yaml
name: Full YAML definition
port: 3000
proxy: # Proxy setup
  enabled: true
  host: https://proxy.to.this.com # No matched requests will be forewarded to
  insecure_skip_verify: true # true to skip TLS verification
  request_headers: # Pass these request headers to the host
    X-Forward: 123
  response_headers: # Append these response headers
    X-Response: 123
auto_cors: true # Auto response OPTIONS requests
tls: # Setup TLS
  enabled: true
  pem_cert_path: "/path/cert.pem" # Path to the certificate
  pem_key_path: "/path/key.pem" # Path to the key
routes:
  - method: POST # Default is GET. 
    path: /path1/path2/:route-name/?name=John&age=20 # Can also support wild card. /path1/*
    responses:
      - status: 200 # HTTP response status
        disabled: true # Default is false
        delay: 300 # Delay response to 300 ms
        headers:    # Response headers
          Content-Type: application/json
        body: | # Response body
          {
            "name": "John Doe"
          }
        file_path: "/path/to/file" # Download file. relative path to the mock file, or absolute path. 
        rule_aggregation: "and" # rule can be "and" or "or"
        rules: # can have multiple rules.
        - target: header # Check if the request header matched
          modifier: "Authorization"
          value: "secret"
          operator: "equal" # or regex
        - target: query_string # Check if the request query string matched
          modifier: "age"
          value: "20"
          operator: "equal"       
        - target: body # Check if the request body matched
          modifier: ".address.postcode" # Check if the request body JSON has the postcode matched
          value: "4122"
          operator: "equal"      
        - target: cookie # Check if the request has cookies matched
          modifier: "cookie-name"
          value: "cookie-value"
          operator: "equal"      
        - target: route_param # Check if the request has route param matched
          modifier: "route-name"
          value: "route-value"
          operator: "equal"      
        - target: request_number # Check against total requets matched
          value: "3"
          operator: "equal"             
```
