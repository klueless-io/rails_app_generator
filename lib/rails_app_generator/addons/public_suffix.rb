# frozen_string_literal: true

# lib/rails_app_generator/rag_initializer.rb
# rag.add_option :add_public_suffix             , type: :boolean, default: false

module RailsAppGenerator
  # Custom add-ons for RailsAppGenerator
  module AddOns
    # Add PublicSuffix to rails application
    class PublicSuffix < RailsAppGenerator::Addon
      required_gem gem.version('public_suffix', '5.0.0', 'PublicSuffix can parse and decompose a domain name into top level domain, domain and subdomains.')

      def apply
        say 'Setting up PublicSuffix'
        # template('public_suffix_template.rb', 'target/public_suffix.rb', force: true)
        # template('app/javascript/stylesheets/components.scss')
        # create_file('target/public_suffix.rb', 'put your content here')
        # directory 'app/template', 'app/target', force: true
        # empty_directory 'app/target'
        # inject_into_file('app/application.js', "some content")
        # rails_command('tailwindcss:install')
      end

      def before_bundle
        say 'Setting up PublicSuffix - before bundle install'
      end

      def after_bundle
        say 'Setting up PublicSuffix - after bundle install'
      end
    end
  end
end
