require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require 'csv'
require './lib/attendee'
require './lib/cleaner'


class AttendeeTest < Minitest::Test

  def test_attendee_initializes_with_full_set_of_instance_variables
    row = {last_name: "Schlereth", first_name: "Ali", email_address: "abc@email.com", homephone: "1234567890", street: "123 Home St", city: "City", state: "ST", zipcode: "12345"}
    attendee = Attendee.new(row)

    assert_equal "Schlereth", attendee.last_name
    assert_equal "Ali", attendee.first_name
    assert_equal "abc@email.com", attendee.email_address
    assert_equal "1234567890", attendee.homephone
    assert_equal "123 Home St", attendee.street
    assert_equal "City", attendee.city
    assert_equal "ST", attendee.state
    assert_equal "12345", attendee.zipcode
    assert_equal nil, attendee.district
  end

end
