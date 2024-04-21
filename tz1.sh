#!/bin/bash

in_dir=$1
out_dir=$2

find "$in_dir" -type f | while IFS= read -r file; 
do
    base_name=$(basename "$file")
    if [ -e "$out_dir/$base_name" ]; then
        dir_name=$(dirname "$file" | sed -e "s|$in_dir||g" -e 's|/|_|g')
        cp "$file" "$out_dir/$dir_name$base_name"
    else
        cp "$file" "$out_dir/$base_name"
    fi
done