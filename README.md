# Rails App Generator

> Create new Rails Application with custom opinions

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rails_app_generator'
```

And then execute:

```bash
bundle install
```

Or install it yourself as:

```bash
gem install rails_app_generator
```

### Use the Gem

```
rag rag-simple
rag rag-tailwind
rag rag-bootstrap
```

### Create new Addon to Rails App Generator

If you need to make a new addon available then use `thor addon:new`

Generally an Addon will be for a gem so if you use the `--gem` option, it will bring in the GEM info such as latest version number

```
thor addon:new image_processing --gem
thor addon:new kaminari --gem
```

### Create new Profile to Rails App Generator

A profile is a sample Rails application template with files that allows you to test one or more Addons and produces a working Rails 7 application.

If you are just keeping the example to a simple GEM then use the `--variant` option with the folder you would like to write code into, e.g. `addons`

```
thor profile:new factory_bot --variant=addons
thor profile:new kaminari --variant=addons
```

## Notes

You can use rails_app_generator to create Rails 7 applications
You can use rails_app_generator with ruby 2.7 or 3.1

Rails new uses a batteries included approach, this means that you get everything and if you don't want a feature you need to turn it off explicitly using --skip-feature
I hope to change the focus in this project so that you get very minimal installation and then you turn on what you want explicitly.
Templates for rails are separated from templates for addons

## Stories

### Main Story

As a Developer, I want to create new Rails application with flexible opinions so that I can build different rails proof of concepts

[Project Plan](./docs/project-plan.md)


## Usage
See all [usage examples](./USAGE.md)



## Development

Checkout the repo

```bash
git clone https://github.com/klueless-io/rails_app_generator
```

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. 

You can also run `bin/console` for an interactive prompt that will allow you to experiment.

```bash
bin/console

Aaa::Bbb::Program.execute()
# => ""
```

`rails_app_generator` is setup with Guard, run `guard`, this will watch development file changes and run tests automatically, if successful, it will then run rubocop for style quality.

To release a new version, update the version number in `version.rb`, build the gem and push the `.gem` file to [rubygems.org](https://rubygems.org).

```bash
rake publish
rake clean
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/klueless-io/rails_app_generator. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Rails App Generator project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/klueless-io/rails_app_generator/blob/master/CODE_OF_CONDUCT.md).

## Copyright

Copyright (c) David Cruwys. See [MIT License](LICENSE.txt) for further details.
