#!/bin/ash
#set -exuo pipefail

cd /vuepress/docs

echo "Cleanup previous VuePress build..."
rm -rf .vuepress/dist
echo "Cleanup done."

echo "VuePress build..."
vuepress build
echo "VuePress build done."

echo "Copying HTML files..."
cp -R .vuepress/dist/* /vuepress/html/
echo "Copied HTML files."

echo "Cleanup VuePress build..."
rm -rf .vuepress/dist
echo "Cleanup done."

echo "END"
