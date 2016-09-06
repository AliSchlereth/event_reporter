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
      email = clean_email(row[:email_address])
      home_phone = clean_home_phone(row[:home_phone])
      # street = row[:street].to_s
      # city = row[:city].to_s
      cleaned_attendees[row[:id]] = {"first_name" => clean_first_name ,
                                      "last_name" => clean_last_name ,
                                      "email"     => clean_email
                                    }
      # binding.pry
    end
  end

  def clean_first_name(first_name)
    first_name = "" if first_name.nil?
    first_name.strip.downcase.capitalize
  end

  def clean_last_name(last_name)
    last_name = "" if last_name.nil?
    last_name.strip.downcase.capitalize
  end

  def clean_email(email)
    email = "" if email.nil?
    email
  end

  def clean_home_phone(phone)
    phone = "0000000000" if phone.nil?
    phone.to_s.delete("-")
  end

end
