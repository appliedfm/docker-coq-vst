# docker-coq-vst

Docker images of the Coq proof assistant, with compcert and VST pre-installed.

Based on [docker-coq](https://github.com/coq-community/docker-coq). Compatible with [docker-coq-action](https://github.com/coq-community/docker-coq-action#custom_image).

## Docker Images

We currently maintain the following images:

| Image | Base | compcert variants | Provides |
| :---- | :--- | :---------------- | :------- |
| [appliedfm/coq](https://hub.docker.com/r/appliedfm/coq)                               | [coqorg/coq](https://hub.docker.com/r/coqorg/coq)                         | | *(Base image)* |
| [appliedfm/coq-compcert](https://hub.docker.com/r/appliedfm/coq-compcert)             | [appliedfm/coq](https://hub.docker.com/r/appliedfm/coq)                   | &check; `x86_64-linux` <br/> &check; `x86_32-linux` | [compcert](https://compcert.org/) |
| [appliedfm/coq-vst](https://hub.docker.com/r/appliedfm/coq-vst)                       | [appliedfm/coq-compcert](https://hub.docker.com/r/appliedfm/coq-compcert) | &check; `x86_64-linux` <br/> &check; `x86_32-linux` | [compcert](https://compcert.org/), [VST](https://vst.cs.princeton.edu/) |
| [appliedfm/coq-vst-certigraph](https://hub.docker.com/r/appliedfm/coq-vst-certigraph) | [appliedfm/coq-vst](https://hub.docker.com/r/appliedfm/coq-vst)           | &check; `x86_64-linux` <br/> &check; `x86_32-linux` | [compcert](https://compcert.org/), [VST](https://vst.cs.princeton.edu/), [CertiGraph](https://github.com/Salamari/CertiGraph/) |


## Building

We provide pre-built images on Docker Hub, which means you probably do not need to build the images yourself. However, if you need a specific combination of versions that we do not provide, then your best bet is to build your own image.

```console
$ source build.sh
$ build__coq                "8.14.1-ocaml-4.12.0-flambda"
$ build__coq_compcert       "8.14.1-ocaml-4.12.0-flambda" "3.9"
$ build__coq_vst            "8.14.1-ocaml-4.12.0-flambda" "3.9" "2.8"
$ build__coq_vst_certigraph "8.14.1-ocaml-4.12.0-flambda" "3.9" "2.8"
```
