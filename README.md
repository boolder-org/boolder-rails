# README

To get started on mac OS:

Basics:
- install homebrew: https://brew.sh/
- install rvm: https://rvm.io


Postgre:
- cd to the app directory
- `brew install postgres`
- `brew services start postgresql`
- `brew install postgis`
- `createdb dump-prod`
- `pg_restore -d dump-prod db/prod.dump`

App:
- cd to the app directory
- install rails: `sudo gem install rails`
- `bundle install`

Run the app:
- `rails s`