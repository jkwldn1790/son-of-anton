#!/bin/bash

# Generate a unique name for the Docker image and container
IMAGE_NAME="son-of-anton"
CONTAINER_NAME="son-of-anton-container"

# If argument equals "build", build the Docker image
if [ "$1" == "build" ]; then
    echo "Building Docker image..."
    docker build -t "${IMAGE_NAME}" .
    if [ $? -eq 0 ]; then
        echo "Docker image built successfully."
    else
        echo "Docker image build failed."
        exit 1
    fi
fi
# If argument equals "run", run the Docker container
if [ "$1" == "run" ]; then
    echo "Running Docker container..."
    docker run -d --name "${CONTAINER_NAME}" -p 5000:5000 "${IMAGE_NAME}"
    if [ $? -eq 0 ]; then
        echo "Docker container is running."
    else
        echo "Docker container failed to start."
        exit 1
    fi
fi
# If no argument is provided, show usage
if [ -z "$1" ]; then
    echo "Usage: $0 {build|run|clean}"
    exit 1
fi
# If the script is run without arguments, show usage
if [ $# -eq 0 ]; then
    echo "Usage: $0 {build|run|clean}"
    exit 1
fi
# clean up
if [ "$1" == "clean" ]; then
    echo "Cleaning up..."
    docker stop "${CONTAINER_NAME}"
    docker rm "${CONTAINER_NAME}"
    docker rmi "${IMAGE_NAME}"
    if [ $? -eq 0 ]; then
        echo "Cleaned up successfully."
    else
        echo "Cleanup failed."
        exit 1
    fi
fi