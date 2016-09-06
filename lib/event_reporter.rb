require 'csv'
require './lib/cleaner'
require './lib/queue'

class EventReporter

  attr_reader :queue

  include Cleaner

  def initialize
    @queue = Queue.new
  end

  def load(file = "event_attendees_short.csv")
    attendees = CSV.open file, headers: true, header_converters: :symbol
    @clean_attendees = clean_data(attendees)
  end

  def clean_data(attendees)
    clean_attendees = Cleaner.clean_manager(attendees)
  end

  def find(attribute, criteria)
    @clean_attendees.select do |row, attendee|
      @queue.insert(attendee) if attendee[attribute] == criteria
    end
  end

  def queue_count
    @queue.count
  end

  def queue_clear
    @queue.clear
  end


end
