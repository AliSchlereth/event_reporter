require './test/test_helper.rb'
require 'pry'
require './lib/repl'

class ReplTest < Minitest::Test

  def test_repl_begins_by_welcoming_the_user_and_initializing_event_reporter
    repl = Repl.new
  end

  def test_initialize_calls_start
  end

  def test_start_calls_command_cycle
  end

  def test_a_load_command_calls_load
  end

end
