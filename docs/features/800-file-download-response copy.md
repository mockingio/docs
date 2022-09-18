---
sidebar_position: 800
---

# Response with file download

```yaml title="download.yaml"
name: Example of mock server with response with file download
port: 3000
routes:
    - path: /download
      responses:
        - file_path: "/tmp/download.txt"
```

- **file_path** - The relative path or absolute path to the download file.


```curl
curl http://127.0.0.1:50692/download
```
