# Build Stage
FROM golang:1.16-alpine AS builder

# Set working directory
WORKDIR /app

# Copy go mod files and download dependencies
COPY go.mod go.sum ./
RUN go mod download

# Copy the entire source code
COPY . .

# Build the application
RUN go build -o server

# Final Stage: Smaller runtime image
FROM alpine:latest

# Set working directory in the container
WORKDIR /app

# Install necessary dependencies
RUN apk add --no-cache ca-certificates

# Copy the built binary from the builder stage
COPY --from=builder /app/server .

# Expose the application's port
EXPOSE 8080

# Set backend to listen on all interfaces (important for Fly)
ENV REQUEST_ORIGIN=https://alex-test-frontend.fly.dev \
    PORT=8080

# Run the application
CMD ["./server"]
