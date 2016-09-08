require './lib/event_reporter'
require './lib/help'

class Repl

  attr_reader :event_reporter

  def initialize
    @event_reporter = EventReporter.new
    start
  end

  def start
    puts "Welcome to Event Reporter"
    load_file_first
  end

  def load_file_first
    puts "Load a file to begin or enter help for available commands"
    input = gets.chomp.downcase.split(" ")

    case input[0]
    when "load"
      loader(input)
    when "help"
      help(input)
      load_file_first
    when "quit"
      return puts "Goodbye"
    else
      puts "Please load a file to continue"
      load_file_first
    end
  end

  def command_cycle
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
    return puts "Invalid Entry" if input.length != 3
    event_reporter.find(input[1], input[2..-1].join)
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
    case input[1]
    when "count"                     then puts event_reporter.queue_count
    when "clear"                     then puts event_reporter.queue_clear
    when "district"                  then event_reporter.queue_district
    when "print" && input.count == 2 then event_reporter.queue_print
    when "print" && input[2] == "by" then print_by(input)
    when "save"                      then save_by(input)
    when "export"                    then export_html(input)
    end
  end

  def rest_of_input(input)
    input.shift(3)
    input = input[0..-1].join
  end

  def print_by(input)
    attribute = rest_of_input(input)
    event_reporter.queue_print_by(attribute)
  end

  def save_by(input)
    filename = rest_of_input(input)
    event_reporter.queue_save_to(filename)
  end

  def export_html(input)
    filename = rest_of_input(input)
    event_reporter.queue_export_html(filename)
  end

end
