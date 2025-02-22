#!/bin/bash

for file in *.tsv; do
        if [ -f "$file" ]; then
                dir_name="${file%.tsv}"
                mkdir -p "$dir_name"
                mv "$file" "$dir_name/"
         fi
done
