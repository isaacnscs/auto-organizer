#!/bin/bash

default=~/Downloads

# Se o usuario nao passar um argumento, sera executado no caminho "default"
if [ ! -z $1 ]; then cd $1; else cd $default; fi

function move {

# Armazer as extensões como strings
   local pictures='*.jpeg *.jpg *.png *.gif'
   local music='ls *.mp3'
   local others='*.torrent *.deb *.iso'
   local documents='*.txt *.pdf'

   mv -n $pictures ~/Pictures
   mv -n $music ~/Music
   mv -n $others ~/Others
   mv -n $documents ~/Documents

}

# Redirecionar saida de erro quando nao existir arquivo com determinada extensao
move 2>/dev/null
