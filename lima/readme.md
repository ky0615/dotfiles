# Apple silicon MacにLimaを入れる

```shell
brew install lima docker docker-credential-helper
lima start docker.yaml

mkdir -p ~/.docker/cli-plugins
curl -SL https://github.com/docker/compose/releases/download/v2.2.3/docker-compose-darwin-aarch64 -o ~/.docker/cli-plugins/docker-compose
chmod +x ~/.docker/cli-plugins/docker-compose
curl -SL https://github.com/docker/buildx/releases/download/v0.8.2/buildx-v0.8.2.darwin-arm64 -o ~/.docker/cli-plugins/docker-buildx
chmod +x ~/.docker/cli-plugins/docker-buildx
```