# Specify a base Image
FROM node:alpine

# Add working dir
WORKDIR /usr/app

# Copy Package.json file to working dir
COPY ./package.json ./

# Install Some dependencies
RUN npm install

# Copy working Dir to Container Dir
COPY ./ ./

# Create a non-root user
RUN adduser -D -u 10001 myuser

# Set the user for subsequent instructions
USER myuser

# Default command
CMD ["npm", "start"]
