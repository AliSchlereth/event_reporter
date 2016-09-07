require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require 'csv'
require './lib/event_reporter'

class EventReporterTest < Minitest::Test

  # def test_event_reporter_loads_a_csv_file
  #   reporter = EventReporter.new
  #
  #   assert_instance_of CSV, reporter.load("event_attendees_short.csv")
  # end

  def test_clean_data_returns_a_hash
    reporter = EventReporter.new

    assert_instance_of Hash, reporter.load
  end

  def test_clean_data_returns_a_hash_of_cleaned_up_data
    reporter = EventReporter.new
    expected = {1 => { "first_name"=>"Allison",
                        "last_name"=>"Nguyen",
                            "email"=>"arannon@jumpstartlab.com",
                       "home_phone"=>"6154385000",
                           "street"=>"3155 19th St NW",
                             "city"=>"Washington",
                            "state"=>"DC",
                          "zipcode"=>"20010"}}

    assert_equal expected, reporter.load("event_attendees_dirty_info.csv")
  end

  def test_find_pushes_rows_of_data_into_queue
    reporter = EventReporter.new
    reporter.load

    assert reporter.queue.queue.empty?

    reporter.find("first_name", "Douglas")

    refute reporter.queue.queue.empty?
  end

  def test_count_returns_number_of_members_in_queue
    reporter = EventReporter.new
    reporter.load

    assert_equal 0, reporter.queue.count

    reporter.find("first_name", "Sarah")

    assert_equal 2, reporter.queue.count
  end

  def test_clear_empties_a_full_queue
    reporter = EventReporter.new
    reporter.load

    assert reporter.queue.queue.empty?

    reporter.find("first_name", "Sarah")

    refute reporter.queue.queue.empty?

    reporter.queue_clear

    assert reporter.queue.queue.empty?
  end



end
