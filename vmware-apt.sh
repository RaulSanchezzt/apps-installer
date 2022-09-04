#!/bin/bash

## VIRTUALIZATION
# VMware Workstation -> https://www.vmware.com/products/workstation-pro/workstation-pro-evaluation.html
sudo apt install -y gcc build-essential linux-headers-$(uname -r)
wget --user-agent="Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0" https://www.vmware.com/go/getworkstation-linux
chmod +x getworkstation-linux
sudo ./getworkstation-linux