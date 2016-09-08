require './lib/event_reporter'
require './lib/help'

class Repl

  attr_reader :event_reporter

  def initialize
    @event_reporter = EventReporter.new
    start
  end
  include Help

  def start
    puts "Welcome to Event Reporter"
    load_file_first
  end

  def load_file_first
    puts "Load a file to begin or enter help for available commands"
    input = gets.chomp.downcase.split(" ")
    if input[0] == "load"
      loader(input)
    elsif input[0] == "help"
      help(input)
      load_file_first
    elsif input[0] == "quit"
      return puts "Goodbye"
    else
      puts "Please load a file to continue"
      load_file_first
    end
  end

  def command_cycle
    # convert to case statement
    puts "Enter a command, or enter 'help' for available commands"
    input = gets.chomp.downcase.split(" ")
    case input[0]
    when "load"  then loader(input)
    when "find"  then find(input)
    when "help"  then help(input)
    when "queue" then queue_filter(input)
    when "quit"  then return puts "Goodbye"
    else puts "Invalid Entry"
    end
    command_cycle
  end

  def loader(input)
    input.length > 1 ? event_reporter.load(input[-1]) : event_reporter.load
    command_cycle
  end

  def find(input)
    binding.pry
    return puts "Invalid Entry" if input.length != 3
    event_reporter.find(input[1], input[-1])
  end

  def help(input)
    if input.length > 1
      input.shift
      puts Help.send(input.join(" "))
    else
      puts Help.all
    end
  end

  def queue_filter(input)
    puts event_reporter.queue_count if input[1] == "count"
    puts event_reporter.queue_clear if input[1] == "clear"

  end


end
