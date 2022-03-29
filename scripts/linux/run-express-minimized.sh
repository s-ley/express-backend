docker run --rm \
    -p 5000:5000 \
    --name $TAG_NAME \
    --net=$DOCKER_NETWORK \
    $TAG_NAME