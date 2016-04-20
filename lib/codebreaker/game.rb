module Codebreaker
  class Game
    def initialize(output)
      @output = output
    end

    def start(secret)
      @secret = secret
      @guesses = 0
      @output.puts 'Welcome to Codebreaker!'
      @output.puts 'Enter guess:'
    end

    def guess(guess)
      @guesses += 1
      marker = Marker.new(@secret, guess)
      @output.puts '+' * marker.exact_match_count + '-' * marker.number_match_count
      @output.puts success_message if marker.guess_is_correct?
    end

    private

    def success_message
      "Congratulations, you broke the code in #{@guesses} #{@guesses == 1 ? 'guess' : 'guesses'}!"
    end
  end
end
