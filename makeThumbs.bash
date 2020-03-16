#!/bin/bash

for dirname in ./assets/images/*; do
    if [ -d "$dirname" ]; then
        echo "Processing: $dirname"
        mkdir -p "$dirname"/thumb
        for image in $dirname/*; do
            if [[ -f $image ]]; then
	        thumbnail=$dirname/thumb/$(basename $image)
	        if [ ! -f $thumbnail ]; then
                    echo "Creating $thumbnail"
	            convert -thumbnail x200 $image $thumbnail
	        fi
            fi
        done
    fi
done

