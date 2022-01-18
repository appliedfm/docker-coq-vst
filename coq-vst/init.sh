#!/usr/bin/env bash

eval $(opam env "--switch=${COMPILER}" --set-switch) \
opam pin add -n -k version coq-vst ${VST_VERSION} \
opam pin add -n -k version coq-vst-32 ${VST_VERSION} \
opam install -y -v -j "${NJOBS}" coq-vst coq-vst-32 \
opam clean -a -c -s --logs \
opam config list && opam list
