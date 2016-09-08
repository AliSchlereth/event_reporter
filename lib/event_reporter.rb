require 'csv'
require './lib/queue'
require './lib/attendee'

class EventReporter

  attr_reader :queue

  def initialize
    @queue = Queue.new
  end

  def load(file = "event_attendees.csv")
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
    @queue.clear
    @clean_attendees.select do |attendee|
      @queue.insert(attendee) if attendee.send(attribute).downcase == criteria
    end
  end

  def queue_count
    @queue.count
  end

  def queue_clear
    @queue.clear
  end

  def queue_district
    @queue.district
  end

  def queue_print
    @queue.print
  end

  def queue_print_by(attribute)
    @queue.print_by(attribute)
  end

  def queue_save_to(filename)
    @queue.save_to(filename)
  end

  def queue_export_html(filename)
    @queue.export_html(filename)
  end
  
end
