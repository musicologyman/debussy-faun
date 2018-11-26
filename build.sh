#!/bin/bash

lilypond --png -dresolution=600 -dclip-systems=#t -dbackend=eps debussy-faun.ly
rm *.midi *.tex *.texi *.count *.eps 

if [ -e debussy-faun.pdf ]
then
  rm *.pdf
fi

if [ ! -d ./media/images ]
then
  mkdir ./media/images
else
  rm ./media/images/*
fi
mv *.png ./media/images/
