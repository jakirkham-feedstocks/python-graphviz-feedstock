#!/bin/bash

# Needed due to the Windows batch script wrappers in conda-forge Graphviz.
# see https://github.com/conda-forge/graphviz-feedstock/blob/bbfe3c7be2a448dd11db165a18c3edfd5ee6a95d/recipe/bld.bat#L27-L32
# Must patch manually as the source code and patch are CRLF and conda-build
# tries to convert the patch to LF, which then won't apply.
patch --binary -p0 -i "${RECIPE_DIR}/windows-bat.patch"

python -m pip install --no-deps --ignore-installed "${SRC_DIR}"
