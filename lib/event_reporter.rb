require 'csv'
require './lib/queue'
require './lib/attendee'

class EventReporter

  attr_reader :queue

  def initialize
    @queue = Queue.new
  end

  def load(file = "event_attendees.csv")
    # binding.pry
    attendees = CSV.open file, headers: true, header_converters: :symbol
    @clean_attendees = create_attendee(attendees)
  end

  def create_attendee(attendees)
    clean_attendees = []
    attendees.each do |row|
      clean_attendees << Attendee.new(row)
    end
    clean_attendees
  end

  def find(attribute, criteria)
    binding.pry
    @queue.clear
    @clean_attendees.select do |attendee|
      @queue.insert(attendee) if attendee.send(attribute).downcase == criteria
    end
  end

  def queue_count
    # binding.pry
    @queue.count
  end

  def queue_clear
    binding.pry
    @queue.clear
  end


end
