# Humane Society of Fairfax County

This is the home of the Ruby for Good project to redo the [old site](http://www.hsfc.org/adopt_forms.php) for the Humane Society of Fairfax County.

Issue tracking can be found [here](https://trello.com/b/uiGhjbJI/humane-society-project).

## Getting Started:

    bundle install
    rake db:create db:migrate
    pg_restore db/hsfc_rubyforgood.dump

## Environment variables

    cp .env-sample .env

Look for Petfinder credentials in Slack channel and add to .env file.

## cms-admin credentials
    username: admin@rubyforgood.com
    password: password
    
  or 
  
    username: admin@cmsfortress.com
    password: 1234qwer

## Managing non-application code (CMS Fixtures):

When you login for the first time, create a site called 'localhost' before attempting the import.

After pulling latest changes from the remote you need to **import** the fixture files into your local db.

    rake comfortable_mexican_sofa:fixtures:import FROM=example.local TO=localhost

When you want to push your changes up to Github and PR in order for others to see and use your changes **export**.

    rake comfortable_mexican_sofa:fixtures:export FROM=localhost TO=example.local

## The Carousel

Upload new photos via the Admin portal. The carousel will cycle through any
images in the file list.

## Contributing:

Branch off of master:

    git checkout -b <name of your feature branch>

Make changes, commit, then push your changes.

    rake db:dump

    git push

Submit PR into master.


