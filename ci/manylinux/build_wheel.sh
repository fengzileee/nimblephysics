#!/usr/bin/env bash
set -e

export VERSION=$(cat ../../VERSION.txt)
export PYTHON_VERSION=cp38-cp38

pushd ../..

rm -rf dist/*
rm -rf build/*
# rm -rf wheelhouse/*

# Actually build the code
python3 setup.py sdist bdist_wheel
python3 -m auditwheel repair --plat manylinux_2_31_x86_64 dist/nimblephysics-${VERSION}-${PYTHON_VERSION}-linux_x86_64.whl
mv dist/nimblephysics-${VERSION}-${PYTHON_VERSION}-linux_x86_64.whl wheelhouse/
