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


Given(/^I am not yet playing$/) do
end

When(/^I start a new game$/) do
  game = Codebreaker::Game.new(tty_output)
  game.start('1234')
end

Then(/^I should see "([^"]*)"$/) do |message|
  expect(tty_output.messages).to include(message)
end

Given(/^the secret code is "([^"]*)"$/) do |secret|
  @game = Codebreaker::Game.new(tty_output)
  @game.start(secret)
end

When(/^I guess "([^"]*)"$/) do |guess|
  @game.guess(guess)
end

Then(/^the mark should be "([^"]*)"$/) do |mark|
  expect(tty_output.messages).to include(mark)
end

Given(/^I am playing the game$/) do
end

Given(/^the secret code is '(\d+)'$/) do |secret|
  @game = Codebreaker::Game.new(tty_output)
  @game.start(secret)
end

When(/^I submit guess '(\d+)'$/) do |guess|
  @game.guess(guess)
end

Then(/^I should also see "([^"]*)"$/) do |message|
  expect(tty_output.messages).to include(message)
end
