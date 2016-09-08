require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/queue'
require './lib/attendee'

class QueueTest < Minitest::Test

  def test_queue_defaults_to_an_empty_hash
    que = Queue.new
    assert_instance_of Array, que.queue
    assert que.queue.empty?
  end

  def test_insert_places_the_entry_into_the_queue
    que = Queue.new
    value = {   last_name: "Nguyen",
               first_name: "Douglas",
            email_address: "arannon@jumpstartlab.com",
                homephone: "6154385000",
                   street: "3155 19th St NW",
                     city: "Washington",
                    state: "DC",
                  zipcode: "20010"}
    attendee = Attendee.new(value)
    assert que.queue.empty?

    que.insert(attendee)

    assert_equal [attendee], que.queue
    refute que.queue.empty?
  end

  def test_count_returns_number_of_members_in_queue
    que = Queue.new
    value = {   last_name: "Nguyen",
               first_name: "Douglas",
            email_address: "arannon@jumpstartlab.com",
                homephone: "6154385000",
                   street: "3155 19th St NW",
                     city: "Washington",
                    state: "DC",
                  zipcode: "20010"}
    attendee = Attendee.new(value)

    assert_equal 0, que.count
    que.insert(attendee)
    assert_equal 1, que.count
  end

  def test_clear_returns_an_empty_array
    que = Queue.new
    value = {   last_name: "Nguyen",
               first_name: "Douglas",
            email_address: "arannon@jumpstartlab.com",
                homephone: "6154385000",
                   street: "3155 19th St NW",
                     city: "Washington",
                    state: "DC",
                  zipcode: "20010"}
    attendee = Attendee.new(value)

    que.insert(attendee)

    assert_equal 1, que.count

    que.clear

    assert_equal 0, que.count
    assert_instance_of Array, que.queue
  end

  def test_print_prints_to_command_line_a_spaced_set_of_data
    que = Queue.new
    value1 = {  last_name: "Nguyen",
               first_name: "Douglas",
            email_address: "arannon@jumpstartlab.com",
                homephone: "6154385000",
                   street: "3155 19th St NW",
                     city: "Washington",
                    state: "DC",
                  zipcode: "20010"}
    attendee1 = Attendee.new(value1)
    value2 = { first_name: "Ali",
                last_name: "Schlereth",
            email_address: "aschlereth@jumpstartlab.com",
                homephone: "9938847568",
                   street: "3155 19th St NW",
                     city: "Washington",
                    state: "DC",
                  zipcode: "20010"}
    attendee2 = Attendee.new(value2)
    que.insert(attendee1)
    que.insert(attendee2)
    assert_equal nil, que.print
  end

  def test_print_by_sorts_the_queue_before_printing
    que = Queue.new
    value1 = {  last_name: "Nguyen",
               first_name: "Douglas",
            email_address: "arannon@jumpstartlab.com",
                homephone: "6154385000",
                   street: "3155 19th St NW",
                     city: "Washington",
                    state: "DC",
                  zipcode: "20010"}
    attendee1 = Attendee.new(value1)
    value2 = { last_name:"Schlereth",
              first_name:"Ali",
           email_address:"aschlereth@jumpstartlab.com",
               homephone: "9938847568",
                  street:"3155 19th St NW",
                    city:"Washington",
                   state:"DC",
                 zipcode:"20010"}
    attendee2 = Attendee.new(value2)
    que.insert(attendee1)
    que.insert(attendee2)

    assert_equal nil, que.print_by("first_name")
  end

  def test_find_district_uses_a_zipcode_to_find_a_legislative_district_number
      que = Queue.new

      assert_equal 0, que.find_district("20010")
  end


  def test_district_updates_attendee_information
    que = Queue.new
    value1 = {  last_name: "Nguyen",
               first_name: "Douglas",
            email_address: "arannon@jumpstartlab.com",
                homephone: "6154385000",
                   street: "3155 19th St NW",
                     city: "Washington",
                    state: "DC",
                  zipcode: "20010"}
    attendee1 = Attendee.new(value1)
    value2 = { last_name:"Schlereth",
              first_name:"Ali",
           email_address:"aschlereth@jumpstartlab.com",
               homephone: "9938847568",
                  street:"3155 19th St NW",
                    city:"Washington",
                   state:"DC",
                 zipcode:"20010"}
    attendee2 = Attendee.new(value2)
    que.insert(attendee1)
    que.insert(attendee2)
    que.district

    assert_equal 0, que.queue[0].district
  end

  def test_save_to_creates_a_new_csv
    que = Queue.new
    value1 = {  last_name: "Nguyen",
               first_name: "Douglas",
            email_address: "arannon@jumpstartlab.com",
                homephone: "6154385000",
                   street: "3155 19th St NW",
                     city: "Washington",
                    state: "DC",
                  zipcode: "20010"}
    attendee1 = Attendee.new(value1)
    value2 = { last_name:"Schlereth",
              first_name:"Ali",
           email_address:"aschlereth@jumpstartlab.com",
               homephone: "9938847568",
                  street:"3155 19th St NW",
                    city:"Washington",
                   state:"DC",
                 zipcode:"20010"}
    attendee2 = Attendee.new(value2)
    que.insert(attendee1)
    que.insert(attendee2)
    que.save_to("test.csv")
    que.save_to("test2.csv")
  end

  def test_export_new_csv_to_html
    que = Queue.new
    value1 = {  last_name: "Nguyen",
               first_name: "Douglas",
            email_address: "arannon@jumpstartlab.com",
                homephone: "6154385000",
                   street: "3155 19th St NW",
                     city: "Washington",
                    state: "DC",
                  zipcode: "20010"}
    attendee1 = Attendee.new(value1)
    value2 = { last_name:"Schlereth",
              first_name:"Ali",
           email_address:"aschlereth@jumpstartlab.com",
               homephone: "9938847568",
                  street:"3155 19th St NW",
                    city:"Washington",
                   state:"DC",
                 zipcode:"20010"}
    attendee2 = Attendee.new(value2)
    que.insert(attendee1)
    que.insert(attendee2)
    que.export_html("test.html")
  end


end
