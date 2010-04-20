require 'optparse'

module Perquackey
  class Application
    def self.run!(argv) #:nodoc:
      new.run!(argv)
    end

    def initialize
      @mode = :console

      @options = OptionParser.new do |opts|
        opts.version = Perquackey::VERSION
        opts.on('-s', '--server [port]', 'Run a web server.') do |port|
          @mode = :server
          @port = port || 3000
        end
      end
    end

    def run!(argv)
      begin
        @options.parse(argv)
      rescue OptionParser::ParseError
        @options.abort($!)
      end

      case @mode
      when :console
        Perquackey::Console.run!
      when :server
        Perquackey::Server.run!(:port => @port)
      end
    end
  end
end
