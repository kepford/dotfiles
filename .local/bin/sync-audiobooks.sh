#!/bin/sh
# Sync audio books from Open Audible to Audiobookshelf app

. ~/.keychain/`/bin/hostname`-sh

# -a uses archive mode which preserves timestamps permissions
rsync -avzh --log-file=/tmp/sync-audiobooks.log --info=stats2 /home/kepford/OpenAudible/books/* containerhost:/home/kepford/appdata/audiobookshelf/audiobooks | tee /tmp/sync-audiobooks-output
notify-send "Sync Audiobooks completed!" "$(tail -15 /tmp/sync-audiobooks-output)"

