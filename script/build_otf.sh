#!/bin/bash
set -o errexit -o nounset -o pipefail
cd "`dirname $0`/.."
[ -d venv ] && source venv/bin/activate
mkdir -p distr/otf
rm -rf distr/otf/*

args=( "$@" )
default_weights=( "Regular" "Bold" )
weights=( "${args[@]:-"${default_weights[@]}"}" )

for weight in "${weights[@]}"; do
    file=distr/otf/FiraCode-${weight}.otf

    echo "Making " ${file}
    rm -rf ${file}
    fontmake -g FiraCode.glyphs -o otf --output-dir distr/otf -i "Fira Code ${weight}"

    echo "Fixing DSIG in " ${file}
    gftools fix-dsig --autofix ${file}
done
