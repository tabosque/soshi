require 'jquery-rails'
require 'jquery-ui-rails'
require 'bootstrap-sass'
require 'bootstrap_form'
require 'redcarpet'
require 'paranoia'

module Soshi
  class Engine < ::Rails::Engine
    isolate_namespace Soshi
  end
end
