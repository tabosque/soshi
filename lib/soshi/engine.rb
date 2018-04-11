require 'jquery-rails'
require 'jquery-ui-rails'
require 'bootstrap-sass'
require 'bootstrap_form'
require 'redcarpet'
require 'paranoia'
require 'acts-as-taggable-on'
require 'tag-it-rails'

module Soshi
  class Engine < ::Rails::Engine
    isolate_namespace Soshi
  end
end
