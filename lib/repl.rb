require './lib/event_reporter'
require './lib/help'
require 'pry'

class Repl

  attr_reader :event_reporter

  def initialize
    @event_reporter = EventReporter.new
    start
  end

  def start
    puts "Welcome to Event Reporter"
    command_cycle
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
  end

  def find(input)
    event_reporter.find(input[1], input[2..-1].join(" "))
  end

  def help(input)
    if input.length > 1
      input.shift
      puts Help.send(input.join("_"))
    else
      puts Help.all
    end
  end

  def queue_filter(input)
    puts event_reporter.queue_count if input[1] == "count"
    puts event_reporter.queue_clear if input[1] == "clear"
    event_reporter.queue_district   if input[1] == "district"
    event_reporter.queue_print      if input[1] == "print" && input.count == 2
    print_by(input)                 if input[1] == "print" && input[2] == "by"
    save_by(input)                  if input[1] == "save"
    export_html(input)              if input[1] == "export"
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

if __FILE__ == $0
  repl = Repl.new
end
