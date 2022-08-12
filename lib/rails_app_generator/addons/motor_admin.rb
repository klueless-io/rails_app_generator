# frozen_string_literal: true

# lib/rails_app_generator/rag_initializer.rb
# rag.add_option :add_motor_admin            , type: :boolean, default: false

module RailsAppGenerator
  # Custom add-ons for RailsAppGenerator
  module AddOns
    # Add MotorAdmin to rails application
    class MotorAdmin < RailsAppGenerator::Addon
      required_gem gem.version('motor-admin', '0.3.6', 'Motor Admin allows to create a flexible admin panel while writing less code.')

      def apply
        say 'Setting up MotorAdmin'
      end

      def before_bundle
        say 'Setting up MotorAdmin - before bundle install'
      end

      def after_bundle
        say 'Setting up MotorAdmin - after bundle install'
      end
    end
  end
end
