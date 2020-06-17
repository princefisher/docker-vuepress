#!/bin/ash
#set -exuo pipefail

cd /vuepress/docs

echo "Cleanup previous VuePress build..."
rm -rf .vuepress/dist
echo "Cleanup done."

echo "VuePress dev..."
vuepress dev