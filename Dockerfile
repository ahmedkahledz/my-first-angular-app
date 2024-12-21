# Step 1: Use a Node.js image to build the Angular app
FROM node:18 AS build-stage

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the Angular app source code
COPY . .

# Build the Angular app for production
RUN npm run build --prod

# Step 2: Use an Nginx image to serve the app
FROM nginx:alpine AS production-stage

# Copy the built Angular app from the build stage to the Nginx web root
COPY --from=build-stage /app/dist/last/browser  /usr/share/nginx/html



# Expose port 80
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]

