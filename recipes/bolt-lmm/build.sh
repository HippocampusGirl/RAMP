#!/bin/bash

cd src

make

mkdir -p ${PREFIX}/bin
install -m775 bolt ${PREFIX}/bin/
