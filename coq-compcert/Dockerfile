ARG BASE_TAG="8.14-ocaml-4.11-flambda"
FROM appliedfm/coq:${BASE_TAG}

ARG COMPCERT_VERSION="3.9"
ENV COMPCERT_VERSION=${COMPCERT_VERSION}

COPY init.sh init.sh
RUN bash -x init.sh

ARG BUILD_DATE
ARG VCS_REF
LABEL org.label-schema.build-date=${BUILD_DATE} \
  org.label-schema.name="applied.fm docker-coq-vst/coq-compcert" \
  org.label-schema.description="applied.fm Docker image for Coq with compcert" \
  org.label-schema.url="https://github.com/appliedfm/docker-coq-vst" \
  org.label-schema.vcs-ref=${VCS_REF} \
  org.label-schema.vcs-url="https://github.com/appliedfm/docker-coq-vst" \
  org.label-schema.vendor="applied.fm" \
  org.label-schema.version=${COQ_VERSION} \
  org.label-schema.schema-version="1.0" \
  maintainer="https://applied.fm"