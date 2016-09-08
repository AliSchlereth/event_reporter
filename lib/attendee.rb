require './lib/cleaner'

class Attendee

  attr_reader :last_name,
              :first_name,
              :email_address,
              :homephone,
              :street,
              :city,
              :state,
              :zipcode
  attr_accessor :district

include Cleaner

  def initialize(row)
    @first_name = clean_name(row[:first_name])
    @last_name = clean_name(row[:last_name])
    @email_address = clean_to_string(row[:email_address])
    @homephone = clean_home_phone(row[:homephone])
    @street = clean_to_string(row[:street])
    @city = clean_to_string(row[:city])
    @state = clean_state(row[:state])
    @zipcode = clean_zipcode(row[:zipcode])
    @district = nil
  end

end
