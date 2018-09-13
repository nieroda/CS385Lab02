FROM alpine

RUN apk update && apk add go git gcc musl-dev
RUN mkdir ~/go
ENV GOPATH /go
ENV PATH $GOPATH/bin:/usr/local/go/bin:/go/bin:$PATH:/$GOROOT/bin
WORKDIR $GOPATH
RUN go version

COPY * /go/src/


RUN go get -t minibank
RUN go install minibank

CMD ["./bin/minibank"]
