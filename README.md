# github action react dockerhubs

1. Dockerfile erstellen

2. yml-file im .github/workflows erstellen
```yaml
name: Build and Push Docker image

on:
  push:
    branches:
      - main
  pull_request:
    branches:
      - main

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout code
        uses: actions/checkout@v2

      - name: Set up Docker Buildx
        uses: docker/setup-buildx-action@v2

      - name: Login to DockerHub
        uses: docker/login-action@v2
        with:
          username: ${{ secrets.DOCKER_USERNAME }}
          password: ${{ secrets.DOCKER_PASSWORD }}

      - name: Set up QEMU
        uses: docker/setup-qemu-action@v2

      - name: Build and push Docker image
        uses: docker/build-push-action@v5
        with:
          context: .
          push: true
          tags: ${{ secrets.DOCKER_USERNAME }}/my-react-app:latest
```
3. Sicherheiten konfigurieren
    1. repository 
    2. Settings > Secrets and variables > actions
    3. Klick: new repository secret
    4. Füge **DOCKER_USERNAME** und **DOCKER_PASSWORD** hinzu
    5. auf main pushen
