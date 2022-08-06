# frozen_string_literal: true

module RailsAppGenerator
  # Custom add-ons for RailsAppGenerator
  module AddOns
    # Add Honeybadger to rails application
    class Honeybadger < Addon
      required_gem gem.version('honeybadger', '4.12.1', 'Make managing application errors a more pleasant experience.')

      def apply
        run('bundle exec honeybadger install 1111')
        say 'Update the honeybadger.yml file with your API key.'

        copy_file('honeybadger.sample.yml', 'config/honeybadger.sample.yml')
        append_to_file('config/locales/en.yml', read_template('en.yml'))
      end
    end
  end
end
