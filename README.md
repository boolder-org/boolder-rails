# README

To get started on mac OS:

Basics:
- install homebrew: https://brew.sh/
- install rvm: https://rvm.io


Postgre:
- cd to the app directory
- `brew install postgres`
- `brew install postgis`
- `brew services start postgresql`
- `createdb dump-prod`
- `pg_restore -d dump-prod db/prod.dump`

App:
- cd to the app directory
- install rails: `sudo gem install rails`
- `bundle install`

Run the app:
- `rails s`


## Optional: JOSM

Josm is an open-source tool used by the OpenStreetMap community.
We use it to edit GeoJson files.

- Follow the instructions here: `https://josm.openstreetmap.de/wiki/Download#macOS`
- Go to File > Preferences > Plugins
- Click on the chexkbox next to `Fastdraw` and `PicLayer`, and then click on OK
- Restart Josm
- In the menu bar (on the left), click on `Fast Drawing mode` and then type `Q` to enter the options dialog. Click on `Draw closed polygons only`