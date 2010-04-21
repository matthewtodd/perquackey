require 'test/unit'
require 'perquackey'

begin
  require 'redgreen' if $stdout.tty?
rescue LoadError
  # It's nice not to have hard dependencies on any gems for testing, so that
  # it's super-easy for your users to run `gem check --test perquackey.`
end
