mkdir Backup

cp -r '/home/$USER/Random Junk' Backup
zip -r  'Backup/Random Junk.zip' 'Backup/Random Junk'
rm -R 'Backup/Random Junk'
echo 'Collected and zipped Random Junk'

cp -r '/home/$USER/Documents' Backup
zip -r 'Backup/Documents.zip' 'Backup/Documents'
rm -R 'Backup/Documents'
echo 'Collected and zipped Documents folder'

cp -r '/home/$USER/.minecraft/saves' Backup
cp -r '/home/$USER/.minecraft/screenshots' Backup
zip -r 'Backup/Minecraft.zip' 'Backup/saves' 'Backup/screenshots'
rm -R 'Backup/saves'
rm -R 'Backup/screenshots'
echo 'Collected and zipped Minecraft worlds and screenshots'

zip -r Backup.zip Backup
rm -R Backup
date=`date +"%I:%M_%d_%B_%Y"`
$(mv Backup.zip `$date `.zip)
scp `$date `.zip pi@ip.address:/path/to/backups/folder
