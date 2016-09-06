require 'csv'

class EventReporter

  def load(file = "event_attendees_short.csv")
    attendees = CSV.open file, headers: true, header_converters: :symbol
    clean_data(attendees)
  end

  def clean_data(attendees)
    cleaned_attendees = {}
    attendees.each do |row|
      first_name = clean_first_name(row[:first_name])
      last_name = clean_last_name(row[:last_name])
      email = clean_to_string(row[:email_address])
      home_phone = clean_home_phone(row[:home_phone])
      street = clean_to_string(row[:street])
      # city = row[:city].to_s
      cleaned_attendees[row[:id]] = {"first_name" => clean_first_name ,
                                      "last_name" => clean_last_name ,
                                      "email"     => clean_email
                                    }
      # binding.pry
    end
  end

  def clean_first_name(first_name)
    first_name.to_s.strip.downcase.capitalize
  end

  def clean_last_name(last_name)
    last_name.to_s.strip.downcase.capitalize
  end

  def clean_to_string(entry)
    entry.to_s
  end

  def clean_home_phone(phone)
    phone.to_s.gsub(/[^0-9]/, '').rjust(10, "0")
  end

end
