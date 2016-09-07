require 'sunlight/congress'

class Queue

  attr_accessor :queue
  def initialize
    @queue = []
  end

  Sunlight::Congress.api_key = "7e848193a2ad41c6b8df67de3de2b459"
  # Sunlight::Congress.api_key = "7e848193a2ad41c6b8df67de3de2b459"


  def insert(attendee)
    @queue << attendee
  end

  def count
    queue.count
  end

  def clear
    @queue = Array.new
  end

  def print
    printf "\n%-15s %-15s %-45s %-15s %-35s %-15s %-10s %s\n", "FIRST NAME", "LAST NAME", "EMAIL", "HOME PHONE", "STREET", "CITY", "STATE", "ZIPCODE"
    queue.each_with_index do |member, i|
      printf "%-15s %-15s %-45s %-15s %-35s %-15s %-10s %s\n", queue[i]['first_name'], queue[i]['last_name'], queue[i]["email"], queue[i]["home_phone"], queue[i]["street"], queue[i]["city"], queue[i]["state"], queue[i]["zipcode"]
    end
    return
  end

  def print_by(attribute)
    @queue = queue.sort_by do |member|
      binding.pry
      member[attribute]
    end
    binding.pry
    print
  end

end
