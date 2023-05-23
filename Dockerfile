# Use an official Golang runtime as the base image
FROM golang:1.16-alpine

# Set the working directory in the container
WORKDIR /app

# Copy the source code into the container
COPY . .

# Build the Go app
RUN go build -o dumbmerch-be

# Expose a port (if required)
EXPOSE 5000

# Define the command to run your app
CMD ["./dumbmerch-be"]
