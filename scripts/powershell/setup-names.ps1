# docker network (should be different from other docker networks in your system)
$env:DOCKER_NETWORK="express_network"

# docker image names (should be different from other docker images in your system)
$env:TAG_NAME="express_server"
$env:DEV_TAG_NAME="express_server_dev"
$env:MYSQL_HOST="mysql_express"

# DB config
$env:MYSQL_DB_NAME="express_db"
$env:MYSQL_ROOTPASSWORD="testrootpassword"
$env:MYSQL_USER="backend_user"
$env:MYSQL_PASSWORD="testpassword"