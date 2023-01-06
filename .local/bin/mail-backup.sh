#!/bin/sh
# Backup all mail to a dir in home that is backed up by our main backup scripts

BACKUP_DIR='/home/kepford/MailBackup'
MAIL_DIR='/home/kepford/.local/share/mail/'

# -a uses archive mode which preserves timestamps permissions
rsync -avzh --delete --log-file=/tmp/mail-backup.log --info=stats2 "$MAIL_DIR" "$BACKUP_DIR" | tee /tmp/mail-backup-output

# notify-send "Mail backup completed!"
notify-send "Mail backup completed!" "$(tail -15 /tmp/mail-backup-output)"

