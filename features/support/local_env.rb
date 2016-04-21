module LocalHelpers
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

World(LocalHelpers)
