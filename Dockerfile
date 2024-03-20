# Use a Node.js base image with a specified version
FROM node:14 AS builder

# Set the working directory inside the container
WORKDIR C:\Users\Atul\OneDrive - Biz4Group\Desktop\videocall-ai

# Copy package.json and package-lock.json to the container
COPY package.json package-lock.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code to the container
COPY . .

# Build the React application
RUN npm run dev

# Use a lightweight Node.js image for serving the built application
FROM node:14-alpine

# Set the working directory inside the container
WORKDIR /src


# Install serve to run the production server
RUN npm install -g serve

# Expose port 3000 to allow external access
EXPOSE 3000

# Define the command to start the production server
CMD ["serve", "-s", "build", "-l", "3000"]




