FROM gcc:latest AS builder

WORKDIR /app

COPY hello.c

RUN gcc -o hello hello.c

FROM debian:bullseye-slim

WORKDIR /app

COPY --from=builder /app/hello .

EXPOSE 8080

CMD ["./hello"]


