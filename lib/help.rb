module Help

  def Help.all
    puts "Commands Available in Event Reporter:\n help\n help(specific command)\n load filename\n find attribute, critera\n queue count\n queue clear\n queue district\n queue print\n queue print by criteria\n queue save to filename.csv\n queue export html filename.html\n"
    puts "For more specifics on any command, enter help followed by method name.\n For example: help load"
  end

  def Help.load
    puts "load: Type 'load' followed by the path to the file you want to load.
      For Example: load ./lib/event_attendees_short.csv
      If you do not pass in a file path, it will automatically load event attendees."
  end

  def Help.queue_count
    puts "queue count: Type 'queue count' to learn the number of entries in the Queue."
  end

  def Help.queue_clear
    puts "queue clear: Type 'queue clear' to remove all entries from the Queue."
  end

  def Help.queue_district
    puts "queue district: Type 'queue distrit' to list out the Representative Disctrict for each
                member of the Queue. This function is only available when 10 or less attendees
                are in the Queue."
  end

  def Help.queue_print
    puts "queue_print: Type 'queue print' to list out all information for each member of the Queue."
  end

  def Help.queue_print_by
    puts "queue print by: Type 'queue print by' followed by the parameters of your search.
                For Example: queue print by zipcode
                This will print out the entire Queue sorted by zipcode.
                Available commands for print by:
                last_name, first_name, email_address,
                homephone, street, city, state, zipcode, district"
  end

  def Help.queue_save_to
    puts "queue save to: Type 'queue save to' followed by the name you'd like to give
              your new file. All saved files will be csv files.
              For Example: queue save to new_file_name.csv"
  end

  def Help.queue_export_html
    puts "queue export html: Type 'queue export html' followed by the csv you'd like to export.
              All files will be exported to html.
              For Example: queue export html new_file_name.html"
  end

  def Help.find
    puts "find: Type 'find' followed by the parameters you would like to search for.
       Your search results will be inserted into the Queue.
       For Example: find zipcode 12345
       Available commands for find:
       last_name, first_name, email_address,
       homephone, street, city, state, zipcode, district"
  end

end
