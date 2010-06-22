require 'optparse/defaults'

module Perquackey
  class Application
    def self.run!(argv) #:nodoc:
      new.run!(argv)
    end

    def initialize
      @options = OptionParser.with_defaults do |opts|
        opts.banner   = "Usage: #{File.basename($0)} [-c|-s]"
        opts.defaults = %w(--console)
        opts.version  = Perquackey::VERSION
        opts.separator ''

        opts.on('-c', '--console', 'Run an interactive console.') do
          @mode = :console
        end

        opts.on('-s', '--server[=port]', 'Run an http server.') do |port|
          @mode = :server
          @port = port || 3000
        end
      end
    end

    def run!(argv)
      @options.order(argv)

      case @mode
      when :console
        Perquackey::Console.run!
      when :server
        Perquackey::Server.run!(:port => @port)
      end
    end
  end
end
