#!/bin/bash

cd /home/erpuser/frappe-bench/apps/
mv tag-erpnext/* ./erpnext/
mv tag-erpnext/.* ./erpnext/
rmdir tag-erpnext
cd /home/erpuser/frappe-bench/apps/erpnext/
/usr/local/bin/virtualenv --quiet env -p python3
./env/bin/python -m pip install --quiet --upgrade pip
./env/bin/python -m pip install --quiet --upgrade .
yarn install
bench build
sudo chown erpuser:erpuser -R /home/erpuser
sudo supervisorctl restart all

