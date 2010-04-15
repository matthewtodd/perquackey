require 'optparse'

module Perquackey
  class Application
    def self.run!(argv) #:nodoc:
      new.run!(argv)
    end

    def initialize
      @mode = :console

      @options = OptionParser.new do |opts|
        opts.banner = "Usage: #{File.basename($0)} [OPTIONS]"
        opts.separator ''
        opts.separator 'Specific options:'

        opts.on('-s', '--server [PORT]', 'Run a web server.') do |port|
          @mode = :server
          @port = port || 3000
        end

        opts.separator ''
        opts.separator 'Common options:'

        opts.on_tail('-h', '--help', 'Show this message.') do
          puts opts
          exit
        end

        opts.on_tail('-v', '--version', 'Print version and exit.') do
          puts "perquackey #{Perquackey::VERSION}"
          exit
        end
      end
    end

    def run!(argv)
      @options.parse!(argv)

      case @mode
      when :console
        Perquackey::Console.run!
      when :server
        Perquackey::Server.run!(:port => @port)
      end
    end
  end
end
