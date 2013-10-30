require 'rubygems'
require 'sinatra/base'
require 'sass'
require 'sinatra/assetpack'

class App < Sinatra::Base

  set :root, File.dirname(__FILE__)

  register Sinatra::AssetPack

  assets do
    serve '/javascripts', from: 'assets/javascripts'
    serve '/stylesheets', from: 'assets/stylesheets'
    serve '/images',      from: 'assets/images'

    # The second parameter defines where the compressed version will be served.
    # (Note: that parameter is optional, AssetPack will figure it out.)
    # The final parameter is an array of glob patterns defining the contents
    # of the package (as matched on the public URIs, not the filesystem)
    js :application, '/js/application.js', [
      '/javascripts/*.js',
    ]

    css :application, '/css/application.css', [
      '/stylesheets/*.css'
    ]

    js_compression  :uglify # :jsmin | :yui | :closure | :uglify
    css_compression :sass   # :simple | :sass | :yui | :sqwish

    prebuild true

    asset_hosts [ ENV['CDN_SUMO_URL'] ] if ENV['CDN_SUMO_URL']
  end

  get '/' do
    erb :index
  end

end
