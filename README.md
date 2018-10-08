# Rails-Films

Rails application inspired by Filmweb.pl

[Live app on Heroku](https://morning-river-44777.herokuapp.com)

Sample editor account - email: zagloba@example.com - password: asdfgh

## About app

* Allows users to create account, login and login with facebook account (User model created with devise).
* Users can add and remove friends. Friendship must be accepted.
  [Idea for friendship model taken from here](https://github.com/tobyond/this_is_the_friend)
* Users add films to personal library - as 'to see' and 'seen'.
* Users can write reviews and rate films.
* Films have associated people like directors, screenwriters and actors.
* Users with editor status can write news connected with certain film.
* Users can comment on news.
  * Comments use action cable feature.
* Simple frontend with bootstrap.
* Very simple tests for models with RSpec
