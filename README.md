# ClickClock


A simple app to log time worked.

What it does/includes:

- user authorization
- hashed passwords and password reset
- users cannot view, destroy or create other user's logs
- users can save a work log with only a start time and "log out" later
- users must provide an email and username on sign up
- work logs can only span a range within a given day (_ie cannot have start time on one day and end time next day_)
- Forgot to "log out"? Home page shows user any open logs

## The Stack

Rails: 5.2.3
Ruby:  2.5.3

DB: Postgres

Helper Gems - Devise(user auth), Simple_Form, Bootstrap, RSpec

See Wiki for [ERD](https://github.com/vwolanyk/click-clock/wiki/ERD)

## To Use:

`git clone https://github.com/vwolanyk/click-clock.git`

`bundle install`

This will create a local postgres db (you must have postgres installed)

`rake db:setup`

Run Server Locally

`rails s`

### Testing

RSpec testing framework [rspec docs](https://rspec.info/documentation/)

`bundle exec rspec spec`
