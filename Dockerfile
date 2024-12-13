FROM gcc:latest AS builder

WORKDIR /app

COPY hello.c .

RUN gcc -o hello hello.c

FROM debian:bullseye-slim

WORKDIR /app
RUN apt-get update && apt-get install -y wget && \
    wget http://ftp.gnu.org/gnu/libc/glibc-2.34.tar.gz && \
    tar -xvzf glibc-2.34.tar.gz && \
    cd glibc-2.34 && \
    mkdir build && cd build && \
    ../configure --prefix=/usr && make && make install && \
    cd / && rm -rf glibc-2.34 glibc-2.34.tar.gz
COPY --from=builder /app/hello .

EXPOSE 8080

CMD ["./hello"]


