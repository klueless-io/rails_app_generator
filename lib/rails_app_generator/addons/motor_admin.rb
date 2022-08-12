# frozen_string_literal: true

module RailsAppGenerator
  # Custom add-ons for RailsAppGenerator
  module AddOns
    # Add MotorAdmin to rails application
    class MotorAdmin < RailsAppGenerator::Addon
      required_gem gem.version('motor-admin', '0.3.6', 'Motor Admin allows to create a flexible admin panel while writing less code.')

      def apply
        say 'Setting up MotorAdmin'
        puts '11111111111111111111111111111111111111111111111111111111111111'
      end

      def before_bundle
        say 'Setting up MotorAdmin - before bundle install'
        puts '22222222222222222222222222222222222222222222222222222222222222'
      end

      def after_bundle
        say 'Setting up MotorAdmin - after bundle install'
        puts '33333333333333333333333333333333333333333333333333333333333333'

        generate('motor:install')
        db_migrate
      end
    end
  end
end
