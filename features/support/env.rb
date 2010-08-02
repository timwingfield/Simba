#$: << 'lib'
Dir["lib/*"].each {|file| require file }

require 'rubygems'
require 'cucumber'
require 'spec/expectations'
