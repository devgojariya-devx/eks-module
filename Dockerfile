# Use official Node.js LTS base image
FROM node:18-alpine

# Create app directory
WORKDIR /app

# Copy package.json and package-lock.json if available
COPY package*.json ./

# Install app dependencies
RUN npm install --production

# Copy application source code
COPY . .

# Expose port the app runs on
EXPOSE 3000

# Run the app
CMD ["npm", "start"]
