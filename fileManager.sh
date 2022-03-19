mkdir Backup

cp -r '/home/louie/Random Junk' Backup
zip -r  'Backup/Random Junk.zip' 'Backup/Random Junk'
rm -R 'Backup/Random Junk'
echo 'Collected and zipped Random Junk'

cp -r '/home/louie/Documents' Backup
zip -r 'Backup/Documents.zip' 'Backup/Documents'
rm -R 'Backup/Documents'
echo 'Collected and zipped Documents folder'

cp -r '/home/louie/.minecraft/saves' Backup
cp -r '/home/louie/.minecraft/screenshots' Backup
zip -r 'Backup/Minecraft.zip' 'Backup/saves' 'Backup/screenshots'
rm -R 'Backup/saves'
rm -R 'Backup/screenshots'
echo 'Collected and zipped Minecraft worlds and screenshots'

zip -r Backup.zip Backup
date=$(date|tr : -|tr ' ' '--')
echo $date
rm -R Backup
scp Backup.zip ubuntu@192.168.0.25:/home/ubuntu/Backups
$(mv Backup.zip `$date`.zip)
#rm Backup.zip
#Rename file to date.
