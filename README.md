# Tellie Fast Facts

Fast Facts game app for interview process.

## Requirements

- Postgres
- Ruby 2.6.6

## Setup

- `bundle install`
- `bin/rails db:setup`
- `bin/rails s`

View at [http://localhost:3000](http://localhost:3000)

## Testing

`bundle exec rspec`

Brakeman analysis: `bundle exec brakeman`

## Linting

`bundle exec rubocop -a -c .rubocop.yml`
