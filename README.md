# Golang s2i builder

This repository contains the source for building a Go application as a reproducible source-to-image (s2i) container image. If the application source code contains a `vendor/` directory, then the `-mod=vendor` flag will be added to the `go build` command.


## Getting started

Create the `s2i` image from the [Dockerfile](./Dockerfile). This downloads the `go` binary and sets the appropriate `$PATH`

```bash
docker build -t go-centos-s2i .
```

Next, run `s2i` against the test application using the `s2i` we created. The `--context-dir` refers to the sub-directory containing the application source files.

```bash
s2i build . --context-dir=test/test-app go-centos-s2i go-webserver
```

Now run the test webserver!

```bash
docker run -p 8080:8080 go-webserver
```
