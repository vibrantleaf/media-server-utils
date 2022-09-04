#!/bin/bash
# MEDIA_PATH = /path/to/your/media/ {Anime, Shows, Movies , etc}
MEDIA_PATH=""


# remove all .nfo(s) from all episodes from all seasons from all shows & movies & music
rm $MEDIA_PATH/{*.nfo,*/*.nfo,*/*/*.nfo,*/*/*.nfo,*/*/*/*.nfo} -v
