From node:19-alpine as build
workdir /app
copy package.json .
run npm install
copy . .

run npm run build

from nginx:1.23-alpine
copy --from=build /app/build/ /usr/share/nginx/html
copy nginx/nginx.conf /etc/nginx/conf.d/default.conf
expose 80

cmd ["nginx", "g", "daemon off;"]
