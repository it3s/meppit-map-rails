describe "static assets integration" do
  it "provides javascripts on the asset pipeline" do
    visit '/assets/meppit-map/main.js'
    visit '/assets/meppit-map/map.js'
    visit '/assets/meppit-map/editor.js'
    visit '/assets/meppit-map/popup.js'
  end

  it "provides meppit-map.css on the asset pipeline" do
    visit '/assets/meppit-map.css'
    page.text.must_include 'url(/assets/layers.png)'
  end

  it "provides pngs on the asset pipeline" do
    visit '/assets/layers.png'
    visit '/assets/marker-icon.png'
  end

end
