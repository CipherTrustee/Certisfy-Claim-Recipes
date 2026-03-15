#!/bin/bash
rm -r "certisfy-claim-recipes"

git clone https://github.com/CipherTrustee/certisfy-claim-recipes.git
echo "ubuntu" | sudo -S rm -r "certisfy-claim-recipes/.git"

cd "certisfy-claim-recipes/public/javascripts"
rm -r certisfy

git clone https://github.com/CipherTrustee/certisfy-js.git
mv "certisfy-js" certisfy
echo "ubuntu" | sudo -S rm -r "certisfy/.git"

cd ../../

npm ci
npm install pg
sudo systemctl restart certisfy-claim-recipes.service
sudo systemctl enable certisfy-claim-recipes.service