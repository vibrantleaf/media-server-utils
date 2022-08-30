#!/bin/bash
LIBRARY_PATH="" # /path/to/your/media 
EXPORT_PATH=""  # /path/to/your/media/exports
DATE="$(date '+%Y-%m-%d')"
EXPORT_STRING="library-export"
IGNORES="metadata|logo.png|*.png|*.jpg|*.jpeg|*.srt|*.en.srt|*.nfo|*.flac|*.mp3|*.ogg|.zip|.pdf|Music|Podcasts"
HARDN_USER="1003"
HARDN_GROUP="1003"
HARDN_MOD="0744"

# CREATE EXPORT PATH
mkdir "$EXPORT_PATH/$DATE"
# XML
tree -I $IGNORES -X "$LIBRARY_PATH" | tee "$EXPORT_PATH/$DATE/$DATE-$EXPORT_STRING.xml"
# JSON
tree -I $IGNORES -J $LIBRARY_PATH | tee $EXPORT_PATH/$DATE/$DATE-$EXPORT_STRING.json
# HTML
tree -I $IGNORES -H MediaLibraryExports --nolinks $LIBRARY_PATH | tee  $EXPORT_PATH/$DATE/$DATE-$EXPORT_STRING.html
# CSV
tree -I $IGNORES -a $LIBRARY_PATH --noreport | sed -e "s/├── /,/g" -e "s/└── /,/g" -e "s/│   /,/g" -e "s/    /,/g" | tee $EXPORT_PATH/$DATE/$DATE-$EXPORT_STRING.csv
# RAW SDTIO OUT
tree -I $INGORES -a $LIBRARY_PATH | tee $EXPORT_PATH/$DATE/$DATE-$EXPORT_STRING.raw-sdtio-out.txt
# HARDEN PERMS
chmod -R $HARDN_MOD $EXPORT_PATH/$DATE
chown -R $HARDN_USER:$HARDN_GROUP $EXPORT_PATH

