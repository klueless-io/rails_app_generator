# require 'uri'
# require 'net/http'
require 'active_model'
require 'pry'

class TestTemplate # < BaseTemplate
  attr_reader :host

  def initialize(host)
    @host = host
  end
  
  def customize_template
    puts 'customize_template'
  end

  def after_bundle
    puts 'after bundle'
  end
end

setup_rails = TestTemplate.new(self)
setup_rails.customize_template

after_bundle do
  setup_rails.after_bundle
end
