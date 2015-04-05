#!/bin/bash
clear
echo "Updating working files"
sudo git pull origin master
echo "Rebuilding assets"
sudo rake assets:clobber
sudo rake assets:precompile
echo "Resetting permission for public folder"
sudo chown -R daemon:daemon public
echo "Resetting permission for tmp folder"
sudo chown -R daemon:daemon tmp
echo "Resetting permission for logs"
sudo chown -R daemon:daemon log
echo "Updating completed"
sudo ~/stack/ctlscript.sh restart apache
echo "Apache restarted"
