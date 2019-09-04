This action will copy a single binary from source container image to a new base 
(similar to what multistage Docker build does).

Usage
====
```
- uses: vrutkovs/action-bin-container@master
  with:
    source_image: source-image:latest
    source_path: /opt/app-root/gobinary
    binary_base: registry.access.redhat.com/ubi8/ubi
    binary_path: /usr/local/bin/my-real-binary
    binary_image: quay.io/vrutkovs/binary:latest
```
is equivalent to building a new dockerfile:
```
FROM registry.access.redhat.com/ubi8/ubi
COPY --from=source-image:latest /opt/app-root/gobinary /usr/local/bin/my-real-binary
ENTRYPOINT ["/usr/local/bin/my-real-binary"]
```
