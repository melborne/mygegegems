$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'mygegegems'
require "tildoc"
require "webmock"
require "vcr"

module Helpers
  def source_root
    File.join(File.dirname(__FILE__), 'fixtures')
  end
end

RSpec.configure do |c|
  c.include Helpers
end

VCR.configure do |c|
  c.cassette_library_dir = 'spec/cassettes'
  c.hook_into :webmock
  c.allow_http_connections_when_no_cassette = true
end
