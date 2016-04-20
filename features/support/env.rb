$LOAD_PATH << File.expand_path('../../../lib', __FILE__)
require 'codebreaker'

module MyHelpers
  class Output
    def messages
      @messages ||= []
    end

    def puts(message)
      messages << message
    end
  end

  def tty_output
    @tty_output ||= Output.new
  end
end

World(MyHelpers)
