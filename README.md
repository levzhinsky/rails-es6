# Rails-es6

**Experimental**

A [Babel](https://babeljs.io/) adapter for the Rails asset pipeline. Plugin is in test mode.

# Usage

* Install babel
```bash
npm install --global babel
```

* Use with Rails
```ruby
# Gemfile
gem 'rails-es6'
```

* Configuration
```ruby
# development.rb
Rails.application.configure do
  # enable source map for debugging
  # false | 'inline'
  config.es6.source_map = 'inline'
end
```

* Create es6 files
```js
// app.js.es6

square = (x) => x * x

class Animal {
  constructor(name) {
    this.name = name
  }
}
```

## Sprockets 3
https://github.com/josh/sprockets-es6

## ToDo
- add units
- add possibility to off source map thru config

