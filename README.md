# Vuepress Builder in Docker
<!-- MarkdownTOC autolink="true" -->

- [Intro](#intro)
- [About this Docker Image](#about-this-docker-image)
	- [Building the Docker Image](#building-the-docker-image)
		- [Build Command Details](#build-command-details)
		- [Example Command](#example-command)
	- [Run the Docker Image](#run-the-docker-image)
		- [Configuration](#configuration)
		- [Run Command Details](#run-command-details)
		- [Example Command](#example-command-1)

<!-- /MarkdownTOC -->

## Intro
- Q: What is Vuepress?
  - A: https://vuepress.vuejs.org
  
## About this Docker Image

- Base: `node:alpine`
- Vuepress layer installed via Yarn

### Building the Docker Image

#### Build Command Details

```bash
docker build -t <name>:<tag> .
```

There are two specialized Dockerfiles:
a. Dockerfile_build -> this results in an image that just builds the HTML files
b. Dockerfile_dev -> this results in an images that spins up the dev server and exposes port 8080

#### Example Command

```bash
docker build -t vuepress:20200617 .
```

### Run the Docker Image 

#### Configuration

The container expects two volumes:
1. `/vuepress/docs/`: bind/mount your project's `docs` folder here.
2. `/vuepress/html/`: bind/mount your target folder here.

#### Run Command Details

```bash
docker run -it --rm --name vuepress -v $SOURCE_FOLDER:/vuepress/docs/:rw -v $TARGET_FOLDER:/vuepress/html/:rw vuepress:20200617
```

- `docker`: the docker cli
- `run`: run an image
- `-it`: interactive plus allocate a pseudo-TTY -> be able to abort (CTRL+C) and get pretty colorized output
- `--rm`: remove container after vuepress build is done 
- `--name vuepress`: name container vuepress for easier reference/debugging
- `-v $SOURCE_FOLDER:/vuepress/docs/:rw`: the `SOURCE_FOLDER` should be an absolute path to your project's `docs` folder.
- `-v $TARGET_FOLDER:/vuepress/html/:rw`: the `TARGET_FOLDER` should be an absolute path to a directory where you want the html files to be written to.
- `vuepress:20200617`: the name and tag of the image you want to run. 
  - (Example we build this Dockerfile and name/tag the image `vuepress:20200617`) 

#### Example Command

```bash
docker run -it --rm --name vuepress -v /data/my-project/docs/:/vuepress/docs/:rw -v /data/my-project/html:/vuepress/html/:rw vuepress:20200617
```

### Run Different Docker Images:

Assuming we build two images:

```bash
docker build -f Dockerfile_build -t vuepress:build .
# and
docker build -f Dockerfile_dev -t vuepress:dev .
```

Then we can run each images like this:

#### Run the Builder

```bash
docker run -it --rm --name vuepress -v /data/my-project/docs/:/vuepress/docs/:rw -v /data/my-project/html:/vuepress/html/:rw vuepress:build
```
#### Run the Dev Server 

- once the server is running you can view the vuepress build results at <https://localhost:8080>

```bash
docker run -it --rm --name vuepress -v /data/my-project/docs/:/vuepress/docs/:rw -p 8080:8080 vuepress:dev
```