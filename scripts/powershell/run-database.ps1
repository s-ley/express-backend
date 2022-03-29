docker run --rm `
    --name=$env:MYSQL_HOST `
    -e MYSQL_USER=$env:MYSQL_USER `
    -e MYSQL_PASSWORD=$env:MYSQL_PASSWORD `
    -e MYSQL_ROOT_PASSWORD=$env:MYSQL_ROOTPASSWORD `
    -p 3306:3306 `
    --net=$env:DOCKER_NETWORK `
    $env:MYSQL_HOST