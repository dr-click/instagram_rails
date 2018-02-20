# InstagramRails

###### Rails application, which allows the user to view their Instagram pictures.

## Project Details:

* Environment

  > Ruby 2.5.0

  > Rails 5.1.4

  > PostgreSQL

* Project dependencies

    > omniauth: Flexible authentication system utilizing Rack middleware

    > devise: Flexible authentication solution for Rails with Warden

    > omniauth-instagram: OmniAuth strategy for Instagram

    > instagram: The official gem for the Instagram API


## Getting Started

  You'll need to do a few things to get up-and-running.  Here are a few items:

  * Install all the necessary gems with ```bundle install```
  * Create your database with ```rails db:create```
  * Update your database with ```rails db:migrate```
  * Start your web server with ```rails server:start```

---

### Test

    Using RSpec and some other testing tool to reach the 97% code coverage, to run the test run the following command:
    ```
    rspec
    ```
    Follow this path to check the code coverage results: APP_ROOT/coverage/index.html


* Test dependencies

    > rspec: Testing framework for Rails

    > faker: A library for generating fake data such as names, addresses, and phone numbers

    > factory_bot_rails: Fixtures replacement with a straightforward definition syntax

    > simplecov: Code coverage for Ruby

    > webmock: Library for stubbing and setting expectations on HTTP requests in Ruby

    > rails-controller-testing: Library for stubbing and setting expectations on HTTP requests in Ruby

---

### Changes todo later

  * Handle Instagram videos
  * Update the UI and include video player
  * Include Instagram likes
