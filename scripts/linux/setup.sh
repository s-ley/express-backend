# Network used to connect express with DB
docker network create $DOCKER_NETWORK
echo $DOCKER_NETWORK
echo 'Network ready.'

# Database image
echo 'Mysql Image Build start'
docker build \
    --build-arg DB_NAME=$MYSQL_DB_NAME \
    -f mysql/Dockerfile \
    -t $MYSQL_HOST \
    ./mysql
echo 'Mysql Image Build end'

# Main backend image
echo 'Main Backend Image Build start'
docker build \
    -f docker/Dockerfile \
    -t $TAG_NAME \
    .
echo 'Main Backend Image Build end'

# Development backend image
echo 'Dev Backend Image Build start'
docker build \
    --build-arg PRODUCTION_TAG=$TAG_NAME \
    -f docker/Dockerfile.dev \
    -t $DEV_TAG_NAME \
    .
echo 'Dev Backend Image Build end'