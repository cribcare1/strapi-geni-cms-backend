# Use Node.js LTS version
FROM node:18-alpine

# Install system dependencies
RUN apk add --no-cache build-base gcc autoconf automake zlib-dev libpng-dev vips-dev > /dev/null 2>&1

# Create app directory
WORKDIR /app

# Enable Corepack and set Yarn version
RUN corepack enable && corepack prepare yarn@3.6.1 --activate

# Copy all files at once to maintain consistency
COPY . .

# Install dependencies and build
RUN yarn install 
RUN yarn why reselect
RUN yarn add @mui/x-charts@latest
RUN yarn add reselect@latest

# Expose port
EXPOSE 1337

# Start the application
CMD ["yarn", "cms"]