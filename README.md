# docker-coq-vst

Docker images of the Coq proof assistant, with compcert and VST pre-installed.

Based on [docker-coq](https://github.com/coq-community/docker-coq). Compatible with [docker-coq-action](https://github.com/coq-community/docker-coq-action#custom_image).

## Docker Images

We currently maintain the following images:

| Image | Base | Provides | compcert variants |
| :---- | :--- | :------- | :---------------- |
| [coq-vst](https://hub.docker.com/r/tcarstens/coq-vst/tags) | [coqorg/coq](https://hub.docker.com/r/coqorg/coq/tags) | [compcert](https://compcert.org/), [VST](https://vst.cs.princeton.edu/) | &check; `x86_64-linux` <br/> &check; `x86_32-linux` |
| [coq-vst-certigraph](https://hub.docker.com/r/tcarstens/coq-vst-certigraph/tags) | [coq-vst](https://hub.docker.com/r/tcarstens/coq-vst/tags) | [compcert](https://compcert.org/), [VST](https://vst.cs.princeton.edu/), [CertiGraph](https://github.com/Salamari/CertiGraph/) | &check; `x86_64-linux` <br/> &check; `x86_32-linux` |


## Building

We provide pre-built images on Docker Hub, which means you probably do not need to build the images yourself. However, if you need a specific combination of versions that we do not provide, then your best bet is to build your own image.

### `coq-vst`

The build is parameterized by choice of:

* "Base tag" from [coqorg/coq](https://hub.docker.com/r/coqorg/coq/tags);
* `compcert` version;
* `vst` version.

A typical build looks something like this (in `bash` shell):

```bash
$ unset -f docker_coq_vst__build_image
$ docker_coq_vst__build_image() {
    BASE_TAG=$1
    COMPCERT_VERSION=$2
    VST_VERSION=$3
    docker build \
        -f coq-vst/Dockerfile \
        --build-arg BASE_TAG="${BASE_TAG}" \
        --build-arg COMPCERT_VERSION="${COMPCERT_VERSION}" \
        --build-arg VST_VERSION="${VST_VERSION}" \
        -t "tcarstens/coq-vst:${BASE_TAG}--compcert-${COMPCERT_VERSION}--vst-${VST_VERSION}" \
        coq-vst
}
$ docker_coq_vst__build_image "8.14-ocaml-4.11-flambda" "3.9" "2.8"
```

### `coq-vst-certigraph`

The build is parameterized by choice of:

* "Base tag" from [coq-vst](https://hub.docker.com/r/tcarstens/coq-vst/tags)

A typical build looks something like this (in `bash` shell):

```bash
$ unset -f docker_coq_vst_certigraph__build_image
$ docker_coq_vst_certigraph__build_image() {
    BASE_TAG=$1
    docker build \
        -f coq-vst-certigraph/Dockerfile \
        --build-arg BASE_TAG="${BASE_TAG}" \
        -t "tcarstens/coq-vst-certigraph:${BASE_TAG}" \
        coq-vst
}
$ docker_coq_vst_certigraph__build_image "8.14.1-ocaml-4.12.0-flambda--compcert-3.9--vst-2.8"
```
