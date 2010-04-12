require 'optparse'
require 'ostruct'

module Perquackey
  class Application
    def initialize(argv)
      @conf = OpenStruct.new(:mode => :console, :port => 3000)

      opts = OptionParser.new do |opts|
        opts.banner = "Usage: #{File.basename($0)} [options]"
        opts.separator ''
        opts.on('-s', '--server', 'Run as a web server') { @conf.mode = :server }
        opts.on('-p', '--port PORT', "Port for web server (defaults to #{@conf.port})") { |port| @conf.port = port }
        opts.on('-h', '--help', 'Show this message') { puts opts; exit }
        opts.separator ''
      end

      opts.parse! argv
    end

    def run!
      case @conf.mode
      when :console
        Perquackey::Console.run!
      when :server
        Perquackey::Server.run!(:port => @conf.port)
      end
    end
  end
end
