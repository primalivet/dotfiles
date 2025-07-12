#!/usr/bin/env bash

set -e

command -V grim        >/dev/null 2>&1 || { echo >&2 "screencaptures could not find dependency 'grim'";        exit 1; }
command -V wf-recorder >/dev/null 2>&1 || { echo >&2 "screencaptures could not find dependency 'wf-recorder'"; exit 1; }
command -V pkill       >/dev/null 2>&1 || { echo >&2 "screencaptures could not find dependency 'pkill'";       exit 1; }
command -V date        >/dev/null 2>&1 || { echo >&2 "screencaptures could not find dependency 'date'";        exit 1; }

REGION=0
OUTPUT_DIR="$HOME/screencaptures"

if [[ ! -d "$OUTPUT_DIR" ]]; then
  mkdir -p "$OUTPUT_DIR"
fi

while [[ "$1" =~ ^-  ]]; do
  case $1 in
    -r|--region) REGION=1; shift 1;;
    *)           echo "Invalid option: $1" >&2; exit1;;
  esac
done

COMMAND=$1
DATE=$(date --iso-8601="seconds")

if [[ "$COMMAND" == "image" ]]; then
  FILENAME="$DATE-image"
  echo "Capturing image" 
  if [[ "$REGION" == "1" ]]; then
    grim -t png -g "$(slurp)" "$OUTPUT_DIR/$FILENAME.png"
  else
    grim -t png "$OUTPUT_DIR/$FILENAME.png"
  fi
elif [[ "$COMMAND" == "video" ]]; then
  FILENAME="$DATE-video"
  echo "Capturing video"
  if [[ "$REGION" == "1" ]]; then
    wf-recorder -g "$(slurp)" -f "$OUTPUT_DIR/$FILENAME.mkv"
  else
    wf-recorder -f "$OUTPUT_DIR/$FILENAME.mkv"
  fi
elif [[ "$COMMNAD" == "stop" ]]; then
  pkill wf-recorder
else
  echo "Unsupported media type"
fi
