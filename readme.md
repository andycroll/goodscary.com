A small, quick app using foundation and sintra to get static ruby-based sites
live on Heroku.

## Before launch

  1. create a 152x152 favicon in assets
  2. create a 144x144 windows tile in assets
  3. choose a background colour for tile
  4. create 32 and 16 favicons in /public
  4. add analytics

## Setup a new repo & heroku for your site

Assuming you have the heroku toolbelt installed.

    git clone git@github.com:andycroll/sinatra-foundation-heroku.git
    mv sinatra-foundation-heroku yoursitename
    cd yoursitename
    rm -rf .git
    git init
    git add .
    git commit -m 'first commit'
    heroku apps:create yoursitename

# Test Locally

    bundle install
    bundle exec rackup -p 9292 config.ru &

## Kill local server

    $ kill %1
