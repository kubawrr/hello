
# Use an official GCC image
FROM gcc:latest

# Set the working directory
WORKDIR /app

# Copy the C file into the container
COPY hello.c .

# Compile the C file
RUN gcc -o hello hello.c

# Command to execute the compiled program
CMD ["./hello"]
