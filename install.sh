#!/bin/env bash
# Run this from the target .git dir.
src="`dirname $0`"
dest="$PWD"
cp "$src"/hooks/* "$dest"/hooks/.

