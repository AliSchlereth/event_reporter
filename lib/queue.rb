require 'sunlight/congress'
require 'json'
require 'open-uri'
require 'csv'
require 'erb'

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
    print_spacing = "%-15s %-15s %-45s %-10s %-15s %-7s %-35s %-15s %s\n"
    printf "\n" + print_spacing,
           "LAST NAME", "FIRST NAME", "EMAIL", "ZIPCODE", "CITY", "STATE", "ADDRESS", "HOME PHONE", "DISTRICT"
    queue.each_with_index do |member, i|
      printf print_spacing,
             queue[i].last_name, queue[i].first_name, queue[i].email_address, queue[i].zipcode, queue[i].city, queue[i].state, queue[i].street, queue[i].homephone, queue[i].district
    end
    return
  end

  def print_by(attribute)
    @queue = queue.sort_by do |member|
      member.send(attribute)
    end
    print
  end

  def district
    return if queue.count > 10
    queue.each do |member|
      zip = member.zipcode
      district_number = find_district(zip)
      member.district = district_number
    end
  end

  def find_district(zip)
    zipcode = zip
    url = "http://congress.api.sunlightfoundation.com/districts/locate?zip=#{zipcode}&apikey=7e848193a2ad41c6b8df67de3de2b459"
    data = JSON.parse(open(url).read)
    district_number = data["results"][0]["district"]
    district_number
  end

  def save_to(input_filename)
    Dir.mkdir("output") unless Dir.exists? "output"
    filename = input_filename

    CSV.open("output/#{filename}", "w") do |csv|
      headers = ["last_name", "first_name", "email_address", "homephone", "street", "city", "state", "zipcode", "district"]
      csv << headers
      queue.each do |member|
        csv << assemble_data_for_member(headers, member)
      end
    end
  end

  def assemble_data_for_member(headers, member)
    result = headers.map do |column|
      member.send(column)
    end
  end

  def export_html(input_filename)
    table = create_table(input_filename)
    Dir.mkdir("output") unless Dir.exists?("output")
    filename = input_filename
    File.open("output/#{filename}", "w") do |file|
      file.puts table
    end
  end

  def create_table(input_filename)
    table_template = File.read "format_csv.erb"
    erb_template = ERB.new table_template
    table = erb_template.result(binding)
  end

end
