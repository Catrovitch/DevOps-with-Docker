# Build Stage
FROM golang:1.16-alpine AS builder

# Set working directory
WORKDIR /app

# Copy go mod files and download dependencies
COPY go.mod go.sum ./
RUN go mod tidy

# Copy the entire source code
COPY . .

# Build the application
RUN go build -o server

# Final Stage: Smaller runtime image
FROM alpine:latest

# Set working directory in the container
WORKDIR /app

# Copy the built binary from the builder stage
COPY --from=builder /app/server .

# Expose the application's port
EXPOSE 8080

# Allow requests from the frontend
ENV REQUEST_ORIGIN=http://localhost:5001

# Run the application
CMD ["./server"]
