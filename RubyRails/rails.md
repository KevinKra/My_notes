# Ruby on Rails

## What is Rails

- Rails is a web application development framework written in the Ruby programming language.
- _Rails is an opinionated software_. It makes the assumption that there is a "best" way to do things - and sometimes discourages alternatives.

#### Rails Philosophy

- **Don't Repeat Yourself (DRY)**
- **Convention Over Configuration**

## Installation

#### Rails Prereqs

- Ruby (requires Rails version `>2.5.0`)
- SQLite3 `sqlite3 --version`
- Rails `gem install rails`

#### Setup

- `rails new <name>`
- `rails new -h` - shows all the command line options for rails.

#### Composition

- `app/`

  - Contains the controllers, models, views, helpers, mailers, channels, jobs, and assets for your application.

- `bin/`

  - Contains the rails script that starts your app and can contain other scripts you use to setup, update, deploy, or run your application.

- `config/`

  - Configure your application's routes, database, and more. This is covered in more detail in Configuring Rails Applications.

- `config.ru`

  - Rack configuration for Rack based servers used to start the application.

- `db/`
  - Contains your current database schema, as well as the database migrations.

* `Gemfile, Gemfile.lock`

  - These files allow you to specify what gem dependencies are needed for your Rails application. These files are used by the Bundler gem. For more information about Bundler, see the Bundler website.

* `lib/`

  - Extended modules for your application.

* `log/`
* `package.json`
* `public/`

  - The only folder seen by the world as-is. Contains static files and compiled assets.

* `Rakefile`
  - This file locates and loads tasks that can be run from the command line. The task definitions are defined throughout the components of Rails. Rather than changing Rakefile, you should add your own tasks by adding files to the lib/tasks directory of your application.
* `storage/`
  - Active Storage files for Disk Service.
* `test/`
  - Unit tests, fixtures, and other test apparatus.
* `tmp/`
* `vendor/`
* `.ruby-version`
