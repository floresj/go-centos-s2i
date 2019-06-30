# go-centos-s2i
FROM openshift/base-centos7

ENV GOVERSION 1.12.6

LABEL maintainer="John Flores"

LABEL io.k8s.description="Golang builder using go mod." \
      io.k8s.display-name="Go $GOVERSION" \
      io.openshift.tags="builder,golang"

RUN wget -O /tmp/go.tar.gz https://dl.google.com/go/go$GOVERSION.linux-amd64.tar.gz && \
      tar -C /usr/local -xzf /tmp/go.tar.gz && \
      rm /tmp/go.tar.gz && \
      export PATH=/usr/local/go/bin:$PATH && \
      go version

ENV PATH /usr/local/go/bin:$PATH

COPY ./s2i/bin/ /usr/libexec/s2i

# This default user is created in the openshift/base-centos7 image
USER 1001

CMD ["/usr/libexec/s2i/usage"]
