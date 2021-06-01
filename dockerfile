FROM node:alpine
WORKDIR '/app'
COPY package.json .
RUN npm install -g npm@7.15.0 && \
    npm install
COPY . .
RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=0 /app/build /usr/share/nginx/html
