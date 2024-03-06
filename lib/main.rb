# frozen_string_literal: true

require "csv"

def main(filepath)
  header_skipped = false
  CSV.foreach(filepath) do |id, name, salary|
    if header_skipped
      puts "#{id}: #{name}, #{salary}"
    else
      header_skipped = true
      next
    end
  end
end

if $PROGRAM_NAME == $0
  filepath = $ARGV[0]
  puts "Processing: #{filepath}."
  main(filepath)
end