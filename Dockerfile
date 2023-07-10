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

# Set ARG for user ID
ARG USER_ID=10001

# Create a non-root user with a user ID between 10000 and 20000
RUN adduser -D -u $USER_ID myuser

# Set the user for subsequent instructions
USER myuser

# Default command
CMD ["npm", "start"]
