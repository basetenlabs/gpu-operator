FROM golang:1.21 AS builder

WORKDIR /
COPY go.mod go.sum ./
RUN go mod download
COPY . .
RUN make gpu-operator-race

FROM nvcr.io/nvidia/gpu-operator:v23.9.1
WORKDIR /
COPY --from=builder /gpu-operator /usr/bin/

USER gpu-operator
ENTRYPOINT ["/usr/bin/gpu-operator"]
