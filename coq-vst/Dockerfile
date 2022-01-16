ARG BASE_TAG="8.14-ocaml-4.11-flambda"
FROM coqorg/coq:${BASE_TAG}

ARG COMPCERT_VERSION="3.9"
ENV COMPCERT_VERSION=${COMPCERT_VERSION}

ARG VST_VERSION="2.8"
ENV VST_VERSION=${VST_VERSION}

# hadolint ignore=SC2046
RUN set -x \
  && sudo apt-get update -y -q \
  && sudo apt-get install -y -q gcc-multilib \
  && eval $(opam env "--switch=${COMPILER}" --set-switch) \
  && opam pin add -n -k version coq-compcert ${COMPCERT_VERSION} \
  && opam pin add -n -k version coq-compcert-32 ${COMPCERT_VERSION} \
  && opam pin add -n -k version coq-vst ${VST_VERSION} \
  && opam pin add -n -k version coq-vst-32 ${VST_VERSION} \
  && opam install -y -v -j "${NJOBS}" coq-vst coq-vst-32 \
  && opam clean -a -c -s --logs \
  && opam config list && opam list

ARG BUILD_DATE
ARG VCS_REF
LABEL org.label-schema.build-date=${BUILD_DATE} \
  org.label-schema.name="The Verified Software Toolchain" \
  org.label-schema.description="A program logic for the C programming language, proved sound with respect to the compcert C semantics." \
  org.label-schema.url="https://vst.cs.princeton.edu/" \
  org.label-schema.vcs-ref=${VCS_REF} \
  org.label-schema.vcs-url="https://github.com/appliedfm/docker-coq-vst" \
  org.label-schema.vendor="applied.fm in partnership with the VST maintainers" \
  org.label-schema.version=${COQ_VERSION} \
  org.label-schema.schema-version="1.0" \
  maintainer="intoverflow@gmail.com"