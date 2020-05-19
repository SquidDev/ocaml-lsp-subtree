#!/usr/bin/env sh

set -xe

if [ ! -d "ocaml-lsp" ]; then
  git clone https://github.com/ocaml/ocaml-lsp.git
else
  git -C ocaml-lsp pull -q
fi

rm -rf vendor/* lsp
cp -r ocaml-lsp/lsp ocaml-lsp/LICENSE.md .
cp -r ocaml-lsp/vendor/csexp ocaml-lsp/vendor/fiber ocaml-lsp/vendor/stdune vendor
