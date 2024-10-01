docker-compose down
docker rmi -f fredking/itgenius &>/dev/null && echo 'Removed old container'
docker-compose up -d
