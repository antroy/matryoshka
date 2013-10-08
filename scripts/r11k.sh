#!/bin/bash
if [ ! -e ~/0/r11k/cache ]
then
    mkdir ~/0/r11k/cache
fi

if [ ! -e ~/0/r11k/branches ]
then
    mkdir ~/0/r11k/branches
fi

pushd ~/0/r11k/cache

if [ ! -e 'puppet' ]
then
    git clone git@gitlabhq.dev.contx.williamhill.plc:provisioning/puppet.git
else
    pushd puppet
    git pull
    popd
fi

cd puppet

for b in `git branch -r | sed "s/.*origin\///"`
do
    echo "Archiving $b"
    git checkout $b
    git archive --format=tar --prefix=$b/ $b | (cd ~/0/r11k/branches && tar -xf -)
done
