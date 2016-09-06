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

  def test_first_name_returns_a_name_with_one_capital_at_the_beginning
    reporter = EventReporter.new

    assert_equal "Ali", reporter.clean_first_name(" ALi")
  end

  def test_last_name_returns_a_name_with_one_capital_at_the_beginning
    reporter = EventReporter.new

    assert_equal "Schlereth", reporter.clean_last_name("schLErEth ")
    assert_equal "", reporter.clean_last_name(nil)
  end

  def test_clean_home_phone_returns_a_10_digit_number_as_a_string
    reporter = EventReporter.new

    assert_equal "0000000000", reporter.clean_home_phone(nil)
    assert_equal "7384950284", reporter.clean_home_phone(7384950284)
    assert_equal "0000950284", reporter.clean_home_phone("950284")
    assert_equal "0000950284", reporter.clean_home_phone("95AA--0284")
    assert_equal "6154385000", reporter.clean_home_phone("6154385000")
    assert_equal "4145205000", reporter.clean_home_phone("414-520-5000")
  end

  def test_clean_to_string_ensures_entry_is_a_string
    reporter = EventReporter.new

    assert_equal "asch@gmail.com", reporter.clean_to_string("asch@gmail.com")
    assert_equal "124 Street Dr", reporter.clean_to_string("124 Street Dr")
    assert_equal "", reporter.clean_to_string(nil)
  end

  def test_clean_state_returns_two_capitalized_letters
    reporter = EventReporter.new

    assert_equal "CO", reporter.clean_state("co")
    assert_equal "IL", reporter.clean_state("illinois")
  end

  def test_clean_zipcode_return_5_digits
    reporter = EventReporter.new

    assert_equal "12345", reporter.clean_zipcode("12345")
    assert_equal "00000", reporter.clean_zipcode(nil)
    assert_equal "00123", reporter.clean_zipcode("123")
    assert_equal "12345", reporter.clean_zipcode("123456789")
  end


  # def test_find_pushes_rows_of_data_into_queue
  #   reporter = EventReporter.new
  #
  #   assert_equal '', reporter.find(:first_name, "Douglas")
  # end

end
