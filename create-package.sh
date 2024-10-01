./mvnw clean install
docker rmi -f fredking/itgenius &>/dev/null && echo 'Removed old container'
docker build -t fredking/itgenius .
docker push fredking/itgenius
