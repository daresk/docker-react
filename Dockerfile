FROM node:16-alpine as builder

WORKDIR '/app'
COPY ./package.json ./
RUN npm install
COPY ./ ./
RUN npm run build

FROM nginx:alpine
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html
# CMD ["start", "nginx"] # it is a default command for the nginx image do not have to specify it
