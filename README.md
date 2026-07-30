Getting Started
------------------------------

This project was started from a Slate template (<a href="https://slatedocs.github.io/slate">slatedocs.github.io/slate</a>).

Quick start:
```bash
bundle install
bundle exec middleman server
```

For more in depth documentation, check the [Slate wiki](https://github.com/slatedocs/slate/wiki).

Releasing
---------------------------------

1. Create a PR - make sure to open against the Greenhouse github repository
2. Get a review and merge your branch
3. Run `bundle exec rake publish` - this will build & push to the `gh-pages` branch
4. Validate the changes are up on `https://developers.greenhouse.io/` - sometimes there is a few minutes lag
