require './test/test_helper.rb'
require 'pry'
require 'csv'
require './lib/event_reporter'

class EventReporterTest < Minitest::Test

  def test_create_attendee_returns_an_array_of_objects
    reporter = EventReporter.new

    assert_instance_of Array, reporter.load("event_attendees_dirty_info.csv")
  end

  def test_find_pushes_rows_of_data_into_queue
    reporter = EventReporter.new
    reporter.load("event_attendees_short.csv")

    assert reporter.queue.queue.empty?

    reporter.find("first_name", "douglas")

    refute reporter.queue.queue.empty?
  end

  def test_count_returns_number_of_members_in_queue
    reporter = EventReporter.new
    reporter.load("event_attendees_short.csv")

    assert_equal 0, reporter.queue.count

    reporter.find("first_name", "sarah")

    assert_equal 2, reporter.queue_count
  end

  def test_clear_empties_a_full_queue
    reporter = EventReporter.new
    reporter.load("event_attendees_short.csv")

    assert reporter.queue.queue.empty?

    reporter.find("first_name", "sarah")

    refute reporter.queue.queue.empty?

    reporter.queue_clear

    assert reporter.queue.queue.empty?
  end

  def test_queue_district_assigns_district_number_to_attendee
    reporter = EventReporter.new
    reporter.load
    reporter.find("last_name", "dolan")
    reporter.queue_district

    assert_equal 5, reporter.queue.queue[0].district
  end

  def test_queue_print_prints_queue_members_informatio_to_command_line
    reporter = EventReporter.new
    reporter.load
    reporter.find("last_name", "dolan")
    reporter.queue_print
  end

  def test_queue_print_by_prints_queue_member_information_sorted_by_given_parameter
    reporter = EventReporter.new
    reporter.load
    reporter.find("first_name", "mary")
    reporter.queue_print_by("last_name")
  end

  def test_queue_save_to_creates_a_new_csv_with_queue_informtion_as_content
    reporter = EventReporter.new
    reporter.load
    reporter.find("first_name", "mary")
    reporter.queue_save_to("marys.csv")
  end

  def test_queue_export_html_creates_a_new_html_with_queue_information_as_content
    reporter = EventReporter.new
    reporter.load
    reporter.find("first_name", "mary")
    reporter.queue_export_html("marys.html")
  end
end
