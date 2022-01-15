# docker-coq-vst

Docker images of the Coq proof assistant, with compcert and VST pre-installed.

Based on [docker-coq](https://github.com/coq-community/docker-coq). Compatible with [docker-coq-action](https://github.com/coq-community/docker-coq-action#custom_image).

Hosted on [docker hub](https://hub.docker.com/repository/docker/tcarstens/coq-vst).

## Building

The build is parameterized by choice of:

* "Base tag" from [coqorg/coq](https://hub.docker.com/r/coqorg/coq/tags);
* `compcert` version;
* `vst` version.

A typical build looks like this:

```console
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
