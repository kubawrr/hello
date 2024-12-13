
# Use an official GCC image
FROM gcc:latest

# Set the working directory
WORKDIR /app

# Copy the C file into the container
COPY hello_world.c .

# Compile the C file
RUN gcc -o hello_world hello_world.c

# Command to execute the compiled program
CMD ["./hello_world"]
