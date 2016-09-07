require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/queue'

class QueueTest < Minitest::Test

  def test_queue_defaults_to_an_empty_hash
    q = Queue.new
    assert_instance_of Array, q.queue
    assert q.queue.empty?
  end

  def test_insert_places_the_entry_hash_into_the_queue_hash
    q = Queue.new
    value = { "first_name"=>"Allison",
               "last_name"=>"Nguyen",
                   "email"=>"arannon@jumpstartlab.com",
              "home_phone"=>"6154385000",
                  "street"=>"3155 19th St NW",
                    "city"=>"Washington",
                   "state"=>"DC",
                 "zipcode"=>"20010"}
    assert q.queue.empty?

    q.insert(value)

    assert_equal [value], q.queue
    refute q.queue.empty?
  end

  def test_count_returns_number_of_members_in_queue
    q = Queue.new
    value = { "first_name"=>"Allison",
               "last_name"=>"Nguyen",
                   "email"=>"arannon@jumpstartlab.com",
              "home_phone"=>"6154385000",
                  "street"=>"3155 19th St NW",
                    "city"=>"Washington",
                   "state"=>"DC",
                 "zipcode"=>"20010"}
    assert_equal 0, q.count
    q.insert(value)
    assert_equal 1, q.count
  end

  def test_clear_returns_an_empty_hash
    q = Queue.new
    value = { "first_name"=>"Allison",
               "last_name"=>"Nguyen",
                   "email"=>"arannon@jumpstartlab.com",
              "home_phone"=>"6154385000",
                  "street"=>"3155 19th St NW",
                    "city"=>"Washington",
                   "state"=>"DC",
                 "zipcode"=>"20010"}
    q.insert(value)

    assert_equal 1, q.count

    q.clear

    assert_equal 0, q.count
  end

  def test_print_prints_to_command_line_a_spaced_set_of_data
    q = Queue.new
    value1 = { "first_name"=>"Douglas",
               "last_name"=>"Nguyen",
                   "email"=>"arannon@jumpstartlab.com",
              "home_phone"=>"6154385000",
                  "street"=>"3155 19th St NW",
                    "city"=>"Washington",
                   "state"=>"DC",
                 "zipcode"=>"20010"}
    value2 = { "first_name"=>"Ali",
                "last_name"=>"Schlereth",
                    "email"=>"aschlereth@jumpstartlab.com",
              "home_phone" => "9938847568",
                   "street"=>"3155 19th St NW",
                     "city"=>"Washington",
                    "state"=>"DC",
                  "zipcode"=>"20010"}
    q.insert(value1)
    q.insert(value2)
    assert_equal nil, q.print
  end

  def test_print_by_sorts_the_queue_before_printing
    q = Queue.new
    value1 = { "first_name"=>"Douglas",
               "last_name"=>"Nguyen",
                   "email"=>"arannon@jumpstartlab.com",
              "home_phone"=>"6154385000",
                  "street"=>"3155 19th St NW",
                    "city"=>"Washington",
                   "state"=>"DC",
                 "zipcode"=>"20010"}
    value2 = { "first_name"=>"Ali",
                "last_name"=>"Schlereth",
                    "email"=>"aschlereth@jumpstartlab.com",
              "home_phone" => "9938847568",
                   "street"=>"3155 19th St NW",
                     "city"=>"Washington",
                    "state"=>"DC",
                  "zipcode"=>"20010"}
    q.insert(value1)
    q.insert(value2)
    assert_equal nil, q.print_by("first_name")
  end


end
