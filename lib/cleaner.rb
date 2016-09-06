module Cleaner

  def Cleaner.clean_manager(attendees)
    cleaned_attendees = {}
    attendees.each_with_index do |row, i|
      first_name = clean_name(row[:first_name])
      last_name = clean_name(row[:last_name])
      email = clean_to_string(row[:email_address])
      home_phone = clean_home_phone(row[:homephone])
      street = clean_to_string(row[:street])
      city = clean_to_string(row[:city])
      state = clean_state(row[:state])
      zipcode = clean_zipcode(row[:zipcode])

      cleaned_attendees[i+1] = {"first_name" => first_name,
                                "last_name"  => last_name,
                                "email"      => email,
                                "home_phone" => home_phone,
                                "street"     => street,
                                "city"       => city,
                                "state"      => state,
                                "zipcode"    => zipcode
                                }
    end
    cleaned_attendees
  end

  def Cleaner.clean_to_string(entry)
    entry.to_s
  end

  def Cleaner.clean_name(name)
    name.to_s.strip.downcase.capitalize
  end

  def Cleaner.clean_home_phone(phone)
    phone.to_s.gsub(/[^0-9]/, '').rjust(10, "0")
  end

  def Cleaner.clean_state(state)
    state.upcase[0..1]
  end

  def Cleaner.clean_zipcode(zipcode)
    zipcode.to_s.rjust(5, "0")[0..4]
  end


end
