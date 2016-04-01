# Restaurant reservations

Ruby on Rails project for Internet Software Architecture subject on
Faculty of Technical Sciences in Novi Sad.

####How to run?

1. Install gems with:
  ```
  $ bundle
  ```
2. Create database
  ```
  $ bundle exec rake db:create db:migrate db:test:prepare
  ```
3. Seed some users and restaurants
  ```
  $ bundle exec rake db:seed
  ```
4. Run Rails server
  ```
  $ bundle exec rails s
  ```
5. Visit [http://localhost:3000/](http://localhost:3000/)


Enjoy :)
