# Use Ubuntu 22.04 as the base image
FROM ubuntu:22.04

# Install curl and clean up unnecessary files
RUN apt update && apt install -y curl && rm -rf /var/lib/apt/lists/*

# Set the working directory inside the container
WORKDIR /app

# Copy the script into the container
COPY script.sh /app/script.sh

# Give execution permissions to the script
RUN chmod +x /app/script.sh

# Set the default command to run the script
CMD ["/app/script.sh"]
