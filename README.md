# README

* Ruby version: 2.6.3

* Rails version: 6.0.0

* Database initialization: `rake db:reset` (uses local SQLite)

Some things not addressed:

* Tests: I tend not to use TDD for small webapp exercises. The first test coverage I would add would address the `Analysis` class
* Styling: I'm not a visual designer. My next step would be to blanket apply Bootstrap to everything.
* Data model: I'd break out the `data` attribute on `Analysis` into more typical Postgres columns/types, with the frequency data getting moved to a new child relationship/table. I like using the `json` column approach when building something brand new in an exploratory way.
* Logic: I'd probably move the analysis logic into its own file, as it currently makes the `Analysis` class too heavy. Additionally, the stemming logic is pretty crude at the moment. It handles most scenarios, but fails with `refuses -> refus`.
