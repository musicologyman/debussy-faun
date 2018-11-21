#!/bin/bash

lilypond --png -dresolution=600 -dclip-systems=#t -dbackend=eps debussy-faun.ly
rm *.midi *.tex *.texi *.count *.eps
if [ ! -d png ]
then
  mkdir png
else
  rm ./png/*
fi
mv *.png ./png/
