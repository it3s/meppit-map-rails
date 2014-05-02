git clone https://github.com/it3s/meppit-map.git meppit-map-tmp

echo -n "Copying images... "
cp -r meppit-map-tmp/dist/images vendor/assets/
echo "done."

echo -n "Copying javascript... "
cp meppit-map-tmp/dist/meppit-map.full.js vendor/assets/javascripts/meppit-map.js
cp meppit-map-tmp/dist/meppit-map.min.map vendor/assets/javascripts/meppit-map.js.map
echo "done."

echo -n "Copying stylesheets... "
cp meppit-map-tmp/dist/meppit-map.full.css vendor/assets/stylesheets/meppit-map.css.erb
echo "done."

echo -n "Fixing asset path... "
sed -i -e "s/\(L.Icon.Default.imagePath = [(]path [?] path [+] '[/]' : ''[)]\) [+] 'images';/\1;/g" vendor/assets/javascripts/meppit-map.js
sed -i -e "s/url[(]'\{0,1\}images[/]\(.*.png\)'\{0,1\}[)]/url(<%= asset_path '\1' %>)/g" vendor/assets/stylesheets/meppit-map.css.erb
echo "done."

echo -n "Updating version number... "
VERSION=`sed -n -e 's/ \{0,\}"version": "\(.*\)", \{0,\}/\1/p' meppit-map-tmp/package.json`
sed -i -e "s/VERSION = \".*\"/VERSION = \"${VERSION}\"/g" lib/meppit/map/rails/version.rb
echo "done."

echo -n "Cleaning up... "
rm -rf meppit-map-tmp
echo "done."
