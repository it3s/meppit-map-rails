# Meppit::Map::Rails

## Installation

Add this line to your application's Gemfile:

    gem 'meppit-map-rails', :github => 'it3s/meppit-map-rails'

And then execute:

    $ bundle

## Usage

To start using the leaflet-rails gem, follow the steps below (assuming you use the default asset pipeline):

Open your application-wide CSS file (`app/assets/stylesheets/application.css`) and add the following line as a comment:

```
= require meppit-map
```

After that, open your application-wide Javascript file (typically `app/assets/javascripts/application.js`) and add the following line:

```
= require meppit-map
```

## Contributing

1. Fork it ( http://github.com/it3s/meppit-map-rails/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
