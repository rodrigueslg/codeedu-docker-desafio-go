FROM golang:1.16-alpine AS go-builder
WORKDIR /usr/src/go-app
COPY ./app/ .
RUN go build hello-world.go

FROM scratch
WORKDIR /usr/src/go-app
COPY --from=go-builder /usr/src/go-app .
CMD ["./hello-world"]
