#!/usr/bin/env bash
if [ -z "$1" ]
then
  echo "usage: ./cobol-new.sh <program-id>"
  exit 1
fi

if [ -e "$1.cbl" ]
then
  echo "Overwrite existing file $1.cbl? (Y/n)?"
  read prompt

  if [ "$prompt" == "n" ]
  then
    echo "Not overwriting - exiting instead."
    exit
  else
    rm "$1.cbl"
  fi
fi

touch "$1.cbl"

# Write shell
echo "IDENTIFICATION DIVISION." >> "$1.cbl"
echo "PROGRAM-ID. $1." >> "$1.cbl"
printf "ENVIRONMENT DIVISION.\nDATA DIVISION.\nPROCEDURE DIVISION." >> "$1.cbl"
printf "\n\nPROGRAM-BEGIN.\n\nPROGRAM-DONE.\n\tSTOP RUN.\n" >> "$1.cbl"
