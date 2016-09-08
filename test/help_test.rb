require './test/test_helper.rb'
require 'pry'
require './lib/help'

class HelpTest < Minitest::Test

  def test_help_prints_a_listing_of_possible_commands
    assert_equal nil, Help.all
  end

  def test_help_load_prints_directions_for_load
    assert_equal nil, Help.load
  end

  def test_help_queue_count_prints_directions_for_queue_count
    assert_equal nil, Help.queue_count
  end

  def test_help_queue_clear_prints_directions_for_queue_clear
    assert_equal nil, Help.queue_clear
  end

  def test_help_queue_district_prints_directions_for_queue_district
    assert_equal nil, Help.queue_district
  end

  def test_help_queue_print_prints_directions_for_queue_print
    assert_equal nil, Help.queue_print
  end

  def test_help_queue_print_by_prints_directions_for_queue_print_by
    assert_equal nil, Help.queue_print_by
  end

  def test_help_queue_save_to_prints_directions_for_queue_save_to
    assert_equal nil, Help.queue_save_to
  end

  def test_help_queue_export_prints_directions_for_queue_export
    assert_equal nil, Help.queue_export_html
  end

  def test_help_find_prints_directions_for_find
    assert_equal nil, Help.find
  end

end
