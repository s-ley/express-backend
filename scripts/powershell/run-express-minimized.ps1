docker run --rm `
    -p 5000:5000 `
    --name $env:TAG_NAME `
    --net=$env:DOCKER_NETWORK `
    $env:TAG_NAME