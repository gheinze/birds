#!/bin/bash

titleLine=true

grep "title:\|base:" ./_data/navigation.yml  | sed "s/.*title: //g;s/.*base: //g" | while read LINE; do

  if [ "$titleLine" = "true" ]
  then
      title="$LINE"
      titleLine=false
  else
      base="$LINE"
      titleLine=true
      echo "Title: $title  Base: $base Page: ./pages/$base.html"
      sed "s/TEMPLATE_TITLE/$title/;s/TEMPLATE_BASE/$base/" ./_includes/template.html > ./pages/$base.html
  fi

done

