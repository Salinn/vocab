words = [
    {
        name: 'Anachronism'
    },
    {
        name: 'Chronic'
    },
    {
        name: 'Chronicle'
    },
    {
        name: 'Synchronize'
    },
    {
        name: 'Circuit'
    },
    {
        name: 'Circuitous'
    },
    {
        name: 'Circumference'
    },
    {
        name: 'Circumvent'
    },
    {
        name: 'Circumlocution'
    },
    {
        name: 'Circumspect'
    },
    {
        name: 'Chronological'
    },
    {
        name: 'Chronology'
    }
]

#Word.delete_all
Word.create!(words)

words = Hash.new{ |h, k| h[k] = [] }
x=0
files = Dir["db/old_words/*"]
puts "Files found #{files}"
files.each do |file_name|
  unless File.directory? file_name
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
puts "List of words #{words}"
words.each do |js_word|
  word = nil
  js_word.last.each_with_index do |word_attribute, index|
    puts "Word attribute #{word_attribute}"
    case index
      when 0
        word_name = word_attribute.split('"')[1].downcase
        updated_word = word_name.slice(0,1).capitalize + word_name.slice(1..-1)
        word = Word.create!(name: updated_word)
      when 1
        Definition.create!(word_definition: word_attribute.split('"')[1], word: word)
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