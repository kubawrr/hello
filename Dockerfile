FROM gcc:latest

WORKDIR /app

COPY hello.c

RUN gcc -o hello hello.c

CMD ["./hello"]


