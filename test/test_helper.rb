$:.unshift File.join(File.dirname(__FILE__), '..', 'ext')
$:.unshift File.join(File.dirname(__FILE__), '..', 'lib')

require 'perquackey'
require 'test/unit'

if $stdin.tty?
  require 'rubygems'
  require 'redgreen'
end
