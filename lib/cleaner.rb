module Cleaner

  def clean_to_string(entry)
    entry.to_s
  end

  def clean_name(name)
    name.to_s.strip.downcase.capitalize
  end

  def clean_home_phone(phone)
    phone.to_s.gsub(/[^0-9]/, '').rjust(10, "0")
  end

  def clean_state(state)
    state.upcase[0..1]
  end

  def clean_zipcode(zipcode)
    zipcode.to_s.rjust(5, "0")[0..4]
  end


end
