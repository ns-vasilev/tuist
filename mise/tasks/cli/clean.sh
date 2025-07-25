#!/bin/bash
# mise description="Cleans SPM's .build directory and Tuist-** derived data directories"
set -euo pipefail

DERIVED_DATA_PATH=$($MISE_PROJECT_ROOT/mise/utilities/derived_data_path.sh)

rm -rf $MISE_PROJECT_ROOT/.build
for dir in "$DERIVED_DATA_PATH"tuist-*; do
    # Check if it is a directory before deleting
    if [[ -d "$dir" ]]; then
        echo "Deleting directory: $dir"
        rm -rf "$dir"
    fi
done
for dir in "$DERIVED_DATA_PATH"Tuist-*; do
    # Check if it is a directory before deleting
    if [[ -d "$dir" ]]; then
        echo "Deleting directory: $dir"
        rm -rf "$dir"
    fi
done
