# Ruby on Rails

## Useful Commands

- `rails new MySite`
- `bundle install`
- `rails server` / `rails s`
- `rails generate controller Pages`

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

- `rails new <name>` - creates directory `<name>` and installs gemfile.
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

---

## MVC

### Controller

- A controller's purpose is to receive specific requests for the application. **Routing** decides which controller receives the requests. Often, there is more than one route to each controller, and different routes can be served by different **actions**. Each action's purpose is to collect information to provide it to a view.
- Methods in Rails controllers are referred to as controller actions.

### View

- A view's purpose is to display this information. An important distinction to make is that is the _controller_, not the view, where information is collected. By default, view templates are written in a language called **eRuby (Embedded Ruby)** which is processed by the request cycle in Rails before being sent to the user.

- `articles/new.html.erb`
- `controller/action.format.handler`

### Request / Response Cycle

1. The browser makes a _request_ for localhost:3000
2. The request hits the Rails **router** in config/routes.rb. The Route recognizes the URL and sends the request to the controller.
3. The controller receives the request and processes it.
4. The controller passes the request to the _view_.
5. The **view** renders the HTML.
6. The controller sends the HTML back to the browser for you to see.

#### Router

```
Rails.application.routes.draw do
  // root 'pages#home'
  get 'welcome' => 'pages#home'
end
```

#### Controller w/ home action

```
class PagesController < ApplicationController
  def home
  end
end
```

#### View

```
<div class="main">
  <div class="container">
    <h1>Hello my name is __</h1>
    <p>I make Rails apps.</p>
  </div>
</div>
```

---

### Handlers

- erb (default for HTML)
- builder (XML)
- coffee (JavaScript templates)

### Controller creation

- `rails generate controller Welcome index`

> Running this command will create several files and a route for you.

- the most important files the above commands create are:
  - `app/controllers/welcome_controller.rb`
  - `app/views/welcome/index.html.erb`

### View Root

- Determines the view at the root URL.

```
// config/routes.rb
Rails.application.routes.draw do
  get 'welcome/index'

  // set root
  root 'welcome#index'
end
```

- `root 'welcome#index'` tells Rails to map requests to the root of the application to the welcome controller's index action

### Resource

- A **resource** is the term used for a collection of similar objects, such as articles, people, or animals.
- You can create, read, update, and destroy (CRUD) items for a resource.

- `resources` - Rails provided method that can be used to automatically declare standard REST interactions. This needs to be defined in `config/routes.rb`.

- command: `rails routes` - will show all the defined routes for all the RESTful interactions.

```
Rails.application.routes.draw do
  get 'welcome/index'

  resources :articles

  root 'welcome#index'
end
```

> There are public, private and protected methods in Ruby, but only public methods can be actions for controllers.

```
class ArticlesController < ApplicationController
  def new
  end
end
```

---

## Forms

```
<%= form_with scope: :article, url: articles_path, local: true do |form| %>
  <p>
    <%= form.label :title %><br>
    <%= form.text_field :title %>
  </p>

  <p>
    <%= form.label :text %><br>
    <%= form.text_area :text %>
  </p>

  <p>
    <%= form.submit %>
  </p>
<% end %>
```
