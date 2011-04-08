require "action_view/template"
require "coffee_script"

module CoffeeHandler
  ActionView::Template.register_template_handler :coffee,
    lambda { |template| "CoffeeScript.compile(#{template.source.inspect})" }

  module Coffeerb
    def self.erb_handler
      @@erb_handler ||= ActionView::Template.registered_template_handler(:erb)
    end

    def self.call(template)
      compiled_source = erb_handler.call(template)
      "CoffeeScript.compile(begin;#{compiled_source};end)"
    end
  end

  ActionView::Template.register_template_handler :coffeerb, CoffeeHandler::Coffeerb
end
