# Boolder Rails

Boolder is the best way to discover bouldering in Fontainebleau.

This is the code powering the [Boolder website](https://www.boolder.com) and all the backend & data processing.

More info: https://www.boolder.com/en/about

# Stack

- Ruby On Rails
- PostgreSQL
- Tailwind css
- Stimulus/Turbo


# How to run the app (on a Mac)

## Basics

- install homebrew: https://brew.sh/
- install rvm: https://rvm.io
- install yarn: `brew install yarn`
- install node: `brew install node`


## Install Postgre
- cd to the app directory
- `brew install postgres`
- `brew install postgis`
- `brew services start postgresql`
- `createdb dump-prod`

## Set un the app
- cd to the app directory
- install rails: `sudo gem install rails`
- `bundle install`

Import prod data:
- `dropdb dump-prod && createdb dump-prod`
- `pg_restore -d dump-prod db/prod.dump`

Run the app:
- `rails s`
- `bin/webpack-dev-server` (for JIT compilation)


## Optional: JOSM

Josm is an open source tool used by the OpenStreetMap community.
We use it to edit GeoJSON files.

- Follow the instructions here: `https://josm.openstreetmap.de/wiki/Download#macOS`
- Go to File > Preferences > Plugins
- Click on the chexkbox next to `Fastdraw` and `PicLayer`, and then click on OK
- Restart Josm
- In the menu bar (on the left), click on `Fast Drawing mode` and then type `Q` to enter the options dialog. Click on `Draw closed polygons only`, choose `3` for `Starting Epsilon` and `Simplify with initial epsilon` for `Enter key mode`
