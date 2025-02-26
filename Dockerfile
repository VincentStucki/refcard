# Use the official Node.js image as the base image.
FROM node:14 AS build

# Set the working directory.
WORKDIR /app

# Copy package.json and package-lock.json.
COPY package*.json ./

# Install dependencies.
RUN npm install

# Copy the rest of the application code.
COPY . .

# Build the React application.
RUN npm run build

# Use a lightweight web server to serve the static files.
FROM nginx:alpine

# Copy the build output to the web server's directory.
COPY --from=build /app/build /usr/share/nginx/html

# Expose port 80 to the outside world.
EXPOSE 80

# Command to run the web server.
CMD ["nginx", "-g", "daemon off;"]