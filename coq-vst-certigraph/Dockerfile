ARG BASE_TAG="8.14-ocaml-4.11-flambda--compcert-3.9--vst-2.8"
FROM tcarstens/coq-vst:${BASE_TAG}

# hadolint ignore=SC2046
RUN set -x \
  && eval $(opam env "--switch=${COMPILER}" --set-switch) \
  && git clone https://github.com/Salamari/CertiGraph.git ~/CertiGraph \
  && opam install -y -v -j "${NJOBS}" ~/CertiGraph/coq-certigraph.opam ~/CertiGraph/coq-certigraph-32.opam \
  && rm -rf ~/CertiGraph \
  && opam clean -a -c -s --logs \
  && opam config list && opam list

ARG BUILD_DATE
ARG VCS_REF
LABEL org.label-schema.build-date=${BUILD_DATE} \
  org.label-schema.name="CertiGraph" \
  org.label-schema.description="A library for verifying graph-manipulating programs. Powered by Coq, VST, and CompCert." \
  org.label-schema.url="https://github.com/Salamari/CertiGraph/" \
  org.label-schema.vcs-ref=${VCS_REF} \
  org.label-schema.vcs-url="https://github.com/appliedfm/docker-coq-vst" \
  org.label-schema.vendor="applied.fm in partnership with the CertiGraph maintainers" \
  org.label-schema.version=${COQ_VERSION} \
  org.label-schema.schema-version="1.0" \
  maintainer="intoverflow@gmail.com"