git clone https://github.com/it3s/meppit-map.git meppit-map-tmp

echo -n "Copying images... "
cp -r meppit-map-tmp/dist/images vendor/assets/
echo "done."

echo -n "Copying javascript... "
cp meppit-map-tmp/lib/*.js vendor/assets/javascripts/
echo "done."

echo -n "Updating version number... "
VERSION=`sed -n -e 's/ \{0,\}"version": "\(.*\)", \{0,\}/\1/p' meppit-map-tmp/package.json`
sed -i '' -e "s/VERSION = \".*\"/VERSION = \"${VERSION}\"/g" lib/meppit/map/rails/version.rb
echo "done."

echo -n "Copying coffeescript... "
rm vendor/assets/javascripts/meppit-map/*.js.coffee
cp meppit-map-tmp/src/* vendor/assets/javascripts/meppit-map
for file in vendor/assets/javascripts/meppit-map/*.coffee; do
    sed -i '' -e "s/<%= pkg.version %>/${VERSION}/g" $file
    mv "$file" "${file%.coffee}.js.coffee"
done
touch vendor/assets/javascripts/meppit-map.js.coffee
echo '#= require meppit-map/main' > vendor/assets/javascripts/meppit-map.js.coffee
find vendor/assets/javascripts/ -type f -name "*.coffee" -exec echo "#= require {}" \; | sed -e "s/vendor\/assets\/javascripts\/\(.*\)[.]js[.]coffee/\1/g" >> vendor/assets/javascripts/meppit-map.js.coffee
echo '#= require leaflet' >> vendor/assets/javascripts/meppit-map.js.coffee
find vendor/assets/javascripts/ -type f -name "*.js" -exec echo "#= require {}" \; | sed -e "s/vendor\/assets\/javascripts\/\(.*\)[.]js/\1/g" >> vendor/assets/javascripts/meppit-map.js.coffee
echo "done."

echo -n "Copying stylesheets... "
cp meppit-map-tmp/dist/meppit-map.full.css vendor/assets/stylesheets/meppit-map.css.erb
echo "done."

echo -n "Fixing assets path... "
sed -i '' -e "s/return if L.Icon.Default.imagePath[?]//g" vendor/assets/javascripts/meppit-map/map.js.coffee
sed -i '' -e "s/\(imagePath = [(]if path then path + '\/' else ''[)]\) [+] 'images'/\1/g" vendor/assets/javascripts/meppit-map/map.js.coffee
sed -i '' -e "s/url[(]'\{0,1\}images[/]\(.*.png\)'\{0,1\}[)]/url(<%= asset_path '\1' %>)/g" vendor/assets/stylesheets/meppit-map.css.erb
echo "done."

echo -n "Cleaning up... "
rm -rf meppit-map-tmp
echo "done."
