docker-compose up -d --build
rm -rf ./result
docker cp rust_builder:/usr/share/nginx/html ./result