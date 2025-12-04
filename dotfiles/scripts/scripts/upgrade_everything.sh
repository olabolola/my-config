#!/usr/bin/env bash

set -x
brew update
brew upgrade
brew upgrade --cask

uv self update
uv tool upgrade --all

npm update -g

rustup update
