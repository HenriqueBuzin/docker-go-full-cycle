FROM golang:alpine AS builder

WORKDIR /app

COPY . .

RUN go mod init fullcycle && \
    CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o fullcycle .

FROM scratch

COPY --from=builder /app/fullcycle .

CMD ["./fullcycle"]
