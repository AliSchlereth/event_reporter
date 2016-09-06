require 'sunlight/congress'

class Queue

  attr_accessor :queue
  def initialize
    @queue = []
  end

  Sunlight::Congress.api_key = "7e848193a2ad41c6b8df67de3de2b459"

  def insert(attendee)
    @queue << attendee
  end

  def count
    @queue.count
  end

  def clear
    @queue = Array.new
  end

  def district
  # return  if @queue.count > 10
  # find zipcodes
  # loop through the members of queue and pull the zipcode
  # use that zipcode to return info from Sunlight.
  # load district
  zipcode = "80229"
  district = Sunlight::Congress::District.by_zipcode(zipcode)
  district
  end


end
