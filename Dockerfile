# Build phase
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
COPY yarn.lock .
RUN yarn install
COPY . .
RUN yarn build

# Run phase
FROM nginx:alpine
COPY --from=builder /app/build /usr/share/nginx/html