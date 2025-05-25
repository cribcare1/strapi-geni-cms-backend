# Use Node.js LTS version
FROM node:18-alpine

# Install system dependencies for Strapi
RUN apk add --no-cache \
  build-base \
  gcc \
  autoconf \
  automake \
  zlib-dev \
  libpng-dev \
  vips-dev

# Set working directory
WORKDIR /app

# Enable Corepack and set Yarn version
RUN corepack enable && corepack prepare yarn@3.6.1 --activate

# Copy all files
COPY . .

# Install dependencies
RUN yarn install

# Optional: Add extra packages if needed
# RUN yarn add @mui/x-charts@latest
# RUN yarn add reselect@latest

# Build the Strapi admin panel for production
RUN yarn build

# Expose Strapi port
EXPOSE 1337

# Start the app in production mode
CMD ["yarn", "start"]
