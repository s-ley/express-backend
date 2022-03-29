docker run --rm `
    -p 5000:5000 `
    -p 9229:9229 `
    -v ${PWD}:/usr/src/app `
    -v /usr/src/app/node_modules `
    --name $env:DEV_TAG_NAME `
    --net=$env:DOCKER_NETWORK `
    $env:DEV_TAG_NAME