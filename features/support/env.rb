require 'cucumber'
require 'watir-webdriver'
require 'selenium-webdriver'
require 'active_support/inflector'
require 'pry'

I18n.enforce_available_locales = false

DEFAULT_OUT_DIR = File.expand_path(File.join(File.dirname(__FILE__), '..', 'out'), __FILE__)
DEFAULT_ASSET_PERFORMANCE_DIR = File.expand_path(File.join(File.dirname(__FILE__), '..', 'out'), __FILE__)