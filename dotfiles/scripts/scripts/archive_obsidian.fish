#!/usr/bin/env fish

set timestamp (date "+%Y%m%d-%H%M%S")
set source "/Users/olabola/Documents/everything_olabola"
set destination "/Users/olabola/archive/obsidian_archives/archive_$timestamp.zip"

zip -r $destination $source
