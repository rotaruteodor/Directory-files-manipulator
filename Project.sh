#! /usr/bin/bash
cd $HOME
echo "Numele directorului: $1"
echo "Numele subdirectorului: $2"

VAR=$(find / -name "$1")
cd "$VAR"
CurrentPATH=$(dirname "$(pwd)")
cd "$CurrentPATH"

if [ -d "$1" ]; then
echo "Directorul $1 a fost gasit";

if [ ! -d "$2" ]; then
echo "Subdirectorul $2 a fost creat"
mkdir $2
echo "Se muta fisierele..."
mv "$CurrentPATH"/$1/* /"$CurrentPATH"/$2
mv $2 $1
echo "Fisierele au fost mutate cu succes"
fi

if [ -d "$2" ]; then
SUBDIRECTORINITIAL="$2"
mv "$2" "$2 INITIAL"
echo "Subdirectorul $SUBDIRECTORINITIAL a fost creat"
mkdir $SUBDIRECTORINITIAL
echo "Se muta fisierele..."
mv "$CurrentPATH"/$1/* /"$CurrentPATH"/$SUBDIRECTORINITIAL
mv $SUBDIRECTORINITIAL $1
echo "Fisierele au fost mutate cu succes"
fi

fi

if [ ! -d "$1" ]; then
echo "Directorul $1 nu exista";
fi
pwd

