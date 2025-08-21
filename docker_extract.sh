#!/bin/bash

IMAGE_NAME="m5tab5-userdemo:latest"
CONTAINER_NAME="m5tab5-userdemo_container"
BUILD_DIR="/demo/M5Tab5-UserDemo/platforms/tab5/build/"
FILE1="$BUILD_DIR/m5stack_tab5.elf"
FILE2="$BUILD_DIR/m5stack_tab5.bin"
FILE3="$BUILD_DIR/m5stack_tab5.map"
FILE4="$BUILD_DIR/merged-tab5.bin"

OUT_DIR="./output"
mkdir -p ${OUT_DIR}

# Run the Docker container in detached mode.
docker run -d --name "${CONTAINER_NAME}" "${IMAGE_NAME}"    
# Copy files from the image to the host.
docker cp "${CONTAINER_NAME}:${FILE1}" ${OUT_DIR}
docker cp "${CONTAINER_NAME}:${FILE2}" ${OUT_DIR}
docker cp "${CONTAINER_NAME}:${FILE3}" ${OUT_DIR}
docker cp "${CONTAINER_NAME}:${FILE4}" ${OUT_DIR}
# Stop and remove the container.
docker stop "${CONTAINER_NAME}"
docker rm "${CONTAINER_NAME}"
