$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'mygegegems'

module Helpers
  def source_root
    File.join(File.dirname(__FILE__), 'fixtures')
  end
end

RSpec.configure do |c|
  c.include Helpers
end
