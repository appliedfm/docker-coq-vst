#!/usr/bin/env bash

eval $(opam env "--switch=${COMPILER}" --set-switch)
git clone https://github.com/Salamari/CertiGraph.git ~/CertiGraph
opam install -y -v -j "${NJOBS}" ~/CertiGraph/coq-certigraph.opam ~/CertiGraph/coq-certigraph-32.opam
rm -rf ~/CertiGraph
opam clean -a -c -s --logs
opam config list && opam list
