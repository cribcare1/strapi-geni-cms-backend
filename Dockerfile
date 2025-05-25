# Use Node.js LTS version
FROM node:18-alpine

# Install system dependencies
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

# Copy project files
COPY . .

# Install dependencies
RUN yarn install

# Optional: install additional packages (only if needed)
# RUN yarn add @mui/x-charts@latest
# RUN yarn add reselect@latest

# Build Strapi admin panel (required in production)
#RUN yarn build

# Expose port
EXPOSE 1337

# Start using your custom script
CMD ["yarn", "cms"]
