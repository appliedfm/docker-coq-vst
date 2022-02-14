#!/usr/bin/env bash

eval $(opam env "--switch=${COMPILER}" --set-switch)
opam update -y
git clone https://github.com/CertiGraph/CertiGraph.git ~/CertiGraph
opam pin -n -y ~/CertiGraph
opam install -y -v -j "${NJOBS}" coq-certigraph coq-certigraph-32
opam clean -a -c -s --logs
opam config list && opam list
