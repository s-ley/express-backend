# Network used to connect express with DB
docker network create $env:DOCKER_NETWORK
echo 'Network ready.'

# Database image
echo 'Mysql Image Build start'
docker build `
    --build-arg DB_NAME=$env:MYSQL_DB_NAME `
    -f mysql/Dockerfile `
    -t $env:MYSQL_HOST `
    ./mysql
echo 'Mysql Image Build end'

# Main backend image
echo 'Main Backend Image Build start'
docker build `
    -f docker/Dockerfile `
    -t $env:TAG_NAME `
    .
echo 'Main Backend Image Build end'

# Development backend image
echo 'Dev Backend Image Build start'
docker build `
    --build-arg PRODUCTION_TAG=$env:TAG_NAME `
    -f docker/Dockerfile.dev `
    -t $env:DEV_TAG_NAME `
    .
echo 'Dev Backend Image Build end'