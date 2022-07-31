# frozen_string_literal: true

module RailsAppGenerator
  # The application builder allows you to override elements of the application
  # generator without being forced to reverse the operations of the default generator.
  class AppBuilder < Rails::AppBuilder
    # def bin
    #   super
    #   template 'bin/setup.erb', 'bin/setup', force: true
    # end

    # def credentials
    #   super
    #   # This sets up credentials using a custom template for both development and production use
    #   RailsAppGenerator::AddOns::Credentials.apply
    # end

    def readme
      template 'README.md.erb', 'README.md'
    end

    # def ruby_version
    #   RailsAppGenerator::AddOns::RubyVersion.new(Context.new(options)).apply
    # end

    def gemfile
      template 'Gemfile.erb', 'Gemfile'
    end

    # def gitignore
    #   template '.gitignore.erb', '.gitignore'
    # end

    # def database_yml
    #   if options[:database] == 'postgresql'
    #     template 'config/postgresql.yml.erb', 'config/database.yml'
    #   else
    #     super
    #   end
    # end
  end
end
