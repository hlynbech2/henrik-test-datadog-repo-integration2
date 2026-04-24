VERSION=$1

if [ -z "$VERSION" ]; then
  echo "Usage: $0 <version>"
  exit 1
fi

IMAGE_NAME="ementodeveloper/henrik-test-datadog-repo-integration:$VERSION"

# Build the Docker image
docker build --build-arg GIT_COMMIT=$(git log --pretty=format:"%h" -n 1) --platform linux/amd64 -t $IMAGE_NAME .


echo Pushing Docker image to repository as $IMAGE_NAME

docker push $IMAGE_NAME
