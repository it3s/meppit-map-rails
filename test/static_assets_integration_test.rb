describe "static assets integration" do
  it "provides meppit-map.js on the asset pipeline" do
    visit '/assets/meppit-map.js'
    page.text.must_include 'meppit-map'
  end

  it "provides meppit-map.css on the asset pipeline" do
    visit '/assets/meppit-map.css'
    page.text.must_include 'url(/assets/layers.png)'
  end

  it "provides pngs on the asset pipeline" do
    visit '/assets/layers.png'
    visit '/assets/marker-icon.png'
  end

  it "provides maps on the asset pipeline" do
    visit '/assets/meppit-map.js.map'
  end
end
