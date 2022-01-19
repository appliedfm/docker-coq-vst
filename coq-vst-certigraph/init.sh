#!/usr/bin/env bash

eval $(opam env "--switch=${COMPILER}" --set-switch)
git clone https://github.com/Salamari/CertiGraph.git ~/CertiGraph
opam pin -n -y ~/CertiGraph
opam install -y -v -j "${NJOBS}" coq-certigraph coq-certigraph-32
rm -rf ~/CertiGraph
opam clean -a -c -s --logs
opam config list && opam list
