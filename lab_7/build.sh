cd "$(dirname "$0")" || exit
IMAGE_NAME=$1

#
DOCKER_IMAGE=bbk/ac-cc2020/$IMAGE_NAME
sudo docker build -t "$DOCKER_IMAGE" .
sudo docker run -it "$DOCKER_IMAGE"
