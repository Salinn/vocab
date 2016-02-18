words = Hash.new{ |h, k| h[k] = [] }
x=0
files = Dir["../old_files/*"]
files.each do |file_name|
  if !File.directory? file_name
    File.open(file_name, "r") do |f|
      f.each_line do |line|
        if line =~ /new Array/
          x += 1
          next
        end
        word_attributes = words[x]
        words[x] = word_attributes.push line
      end
    end
  end
end
words.each do |word|
  word.last.each_with_index do |word_attribute, index|
    case index
      when 0
        Word.create!(name: word_attribute.split('"')[1])
      when 1
        puts '1'
      when 2
        puts '1'
      when 3
        puts '1'
      when 4
        puts '1'
      when 5
        puts '1'
      when 6
        puts '1'
      when 7
        puts '1'
      when 8
        puts '1'
      when 9
        puts '1'
      when 10
        puts '1'
    end
  end
end