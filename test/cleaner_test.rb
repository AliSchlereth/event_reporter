require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/cleaner'

class CleanerTest < Minitest::Test

  def test_name_returns_a_name_with_one_capital_at_the_beginning
    assert_equal "Ali", Cleaner.clean_name(" ALi")
    assert_equal "Schlereth", Cleaner.clean_name("schLErEth ")
    assert_equal "", Cleaner.clean_name(nil)
  end


  def test_clean_home_phone_returns_a_10_digit_number_as_a_string
    assert_equal "0000000000", Cleaner.clean_home_phone(nil)
    assert_equal "7384950284", Cleaner.clean_home_phone(7384950284)
    assert_equal "0000950284", Cleaner.clean_home_phone("950284")
    assert_equal "0000950284", Cleaner.clean_home_phone("95AA--0284")
    assert_equal "6154385000", Cleaner.clean_home_phone("6154385000")
    assert_equal "4145205000", Cleaner.clean_home_phone("414-520-5000")
  end
  #
  def test_clean_to_string_ensures_entry_is_a_string
    assert_equal "asch@gmail.com", Cleaner.clean_to_string("asch@gmail.com")
    assert_equal "124 Street Dr", Cleaner.clean_to_string("124 Street Dr")
    assert_equal "", Cleaner.clean_to_string(nil)
  end
  #
  def test_clean_state_returns_two_capitalized_letters
    assert_equal "CO", Cleaner.clean_state("co")
    assert_equal "IL", Cleaner.clean_state("illinois")
  end
  #
  def test_clean_zipcode_return_5_digits
    assert_equal "12345", Cleaner.clean_zipcode("12345")
    assert_equal "00000", Cleaner.clean_zipcode(nil)
    assert_equal "00123", Cleaner.clean_zipcode("123")
    assert_equal "12345", Cleaner.clean_zipcode("123456789")
  end
  #
  # def test_clean_data_returns_a_hash_of_cleaned_up_data
  #   expected = {1 => { "first_name"=>"Allison",
  #                       "last_name"=>"Nguyen",
  #                           "email"=>"arannon@jumpstartlab.com",
  #                      "home_phone"=>"6154385000",
  #                          "street"=>"3155 19th St NW",
  #                            "city"=>"Washington",
  #                           "state"=>"DC",
  #                         "zipcode"=>"20010"}}
  #
  #   assert_equal expected, Cleaner.clean_manager("event_attendees_dirty_info.csv")
  # end


end
