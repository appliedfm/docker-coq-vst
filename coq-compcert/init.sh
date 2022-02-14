#!/usr/bin/env bash

eval $(opam env "--switch=${COMPILER}" --set-switch)
opam update -y
opam pin add -n -k version coq-compcert ${COMPCERT_VERSION}
opam pin add -n -k version coq-compcert-32 ${COMPCERT_VERSION}
opam install -y -v -j "${NJOBS}" coq-compcert coq-compcert-32
opam clean -a -c -s --logs
opam config list && opam list
