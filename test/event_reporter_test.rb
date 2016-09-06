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

  # def test_clean_data_returns_a_modified_array
  #   reporter = EventReporter.new
  #
  #   assert_instance_of Array, reporter.load
  # end

  def test_first_name_returns_a_name_with_one_capital_at_the_beginning
    reporter = EventReporter.new

    assert_equal "Ali", reporter.clean_first_name(" ALi")
  end

  def test_last_name_returns_a_name_with_one_capital_at_the_beginning
    reporter = EventReporter.new

    assert_equal "Schlereth", reporter.clean_last_name("schLErEth ")
    assert_equal "", reporter.clean_last_name(nil)

  end

  def test_clean_email_ensure_email_is_a_string
    reporter = EventReporter.new

    assert_equal "asch@gmail.com", reporter.clean_email("asch@gmail.com")
    assert_equal "", reporter.clean_email(nil)
  end


  # def test_find_pushes_rows_of_data_into_queue
  #   reporter = EventReporter.new
  #
  #   assert_equal '', reporter.find(:first_name, "Douglas")
  # end

end
