FROM node:16

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application
COPY . .

# Set the backend URL environment variable for frontend
ENV REACT_APP_BACKEND_URL=http://localhost:8080

# Build the static files
RUN npm run build

# Install serve globally
RUN npm install -g serve

# Expose port 5000 inside the container
EXPOSE 5000

# Command to run the application
CMD ["serve", "-s", "-l", "5000", "build"]
