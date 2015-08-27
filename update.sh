#!/bin/bash
clear
echo "Updating working files"
git pull origin master

echo "Building Gemfile"
bundle install

echo "Checking for migrations"
rake db:migrate RAILS_ENV=production

echo "Rebuilding assets"
rake assets:clobber
rake assets:precompile

echo "Updating completed"

echo "Restarting Passenger"
sudo touch /tmp/restart.txt