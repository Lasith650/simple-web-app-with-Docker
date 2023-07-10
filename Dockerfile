# Stage 1: Build stage
FROM node:alpine AS build

WORKDIR /usr/app

COPY package.json ./

RUN npm install

COPY . .

RUN npm run build

# Stage 2: Production stage
FROM node:alpine

WORKDIR /usr/app

# Create a non-root user with a user ID between 10000 and 20000
RUN adduser -D -u 10001 myuser

COPY --from=build /usr/app/package.json ./
COPY --from=build /usr/app/dist ./dist

USER myuser

CMD ["npm", "start"]
