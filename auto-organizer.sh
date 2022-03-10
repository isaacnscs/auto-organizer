#!/bin/bash

default=~/Downloads

# Se o usuario nao passar um argumento, sera executado no caminho "default"
if [ ! -z $1 ]; then cd $1; else cd $default; fi

function move {

# Armazer as extensões como strings
   local pictures='*.jpeg *.jpg *.png *.gif'
   local music='*.mp3 *.aac *.wav *.wma'
   local documents='*.txt *.pdf *.doc *.docx *.ppt *.odt'
   local videos='*.avi *.mp4 *.mkv'
   
   mv -n $pictures ~/Pictures
   mv -n $music ~/Music
   mv -n $documents ~/Documents
   mv -n $videos ~/Videos

}

# Redirecionar saida de erro quando nao existir arquivo com determinada extensao
move 2>/dev/null
