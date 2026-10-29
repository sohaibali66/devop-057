# Docker guide

Run commands from the project root. The Docker Hub username provided for this project is `sohaib66`; confirm that the `devops-a2` repository exists in that account before pushing. It was not publicly available when checked.

## Check Docker

```sh
docker --version
docker info
```

`docker info` should complete successfully, which also confirms the Docker engine is available.

## Build and run locally

The root `Dockerfile` copies `index.html` and `style.css` into Nginx's document root and exposes container port 80.

```sh
docker build -t devops-a2:manual .
docker run --name devops-a2-local -d -p 8080:80 devops-a2:manual
```

Open <http://localhost:8080> in a browser. The browser request goes to host port 8080, mapped to Nginx's container port 80.

## Check status and logs

```sh
docker ps
docker logs devops-a2-local
```

## Stop and remove the container

```sh
docker stop devops-a2-local
docker rm devops-a2-local
```

If the named container already exists, stop/remove it before reusing the name. These commands do not remove the built image.

## Log in, tag, and push the manual image

Create a Docker Hub access token in your Docker Hub account. Use the Docker CLI's interactive login so the credential is not placed in a committed file or command:

```sh
docker login --username sohaib66
```

When prompted, enter the Docker Hub token as the password. Do not paste a real token into project files, shell history, screenshots, or the GitHub workflow.

Tag and publish:

```sh
docker tag devops-a2:manual sohaib66/devops-a2:manual
docker push sohaib66/devops-a2:manual
```

Verify the repository and `manual` tag in Docker Hub. The CI workflow separately builds and publishes the `latest` tag only on pushes to `main`; see [GITHUB_ACTIONS_GUIDE.md](./GITHUB_ACTIONS_GUIDE.md).
