#!/bin/bash

### Install ocalmfuse tool to mount google drive to host
### Run as root

apt update 
apt install opam -y
opam init
opam update
opam install depext google-drive-ocamlfuse 
echo PATH="$PATH:$HOME/.opam/default/bin" >> ~/.basrc
echo PATH="$PATH:$HOME/.opam/default/bin" >> ~/.zshrc
