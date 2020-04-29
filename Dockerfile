FROM node:10
COPY ./ /app
WORKDIR /app
RUN npm install && npm run build

FROM nginx
RUN mkdir /app
COPY --from=0 /app/dist /app
COPY nginx.conf /etc/nginx/nginx.conf


# 构建你的 Docker 镜像
# docker build . -t my-app

# 运行你的 Docker 镜像
# docker run -d -p 8080:80 my-app
# curl localhost:8080
# <!DOCTYPE html><html lang=en>...</html>