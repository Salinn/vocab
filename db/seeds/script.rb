#require "#{File.dirname(__FILE__)}/../../config/environment.rb"

words = Hash.new{ |h, k| h[k] = [] }
x=0
files = Dir["../old_files/*"]
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
words.each do |word|
  puts word
  word.last.each_with_index do |word_attribute, index|
    case index
      when 0
        current_word = Word.create!(name: word_attribute.split('"')[1])
      when 1
        Definition.create!(word: current_word, word_definition: word_attribute.split('"')[1])
      when 2
        Sentence.create!(word: current_word, word_sentence: word_attribute.split('"')[1])
      when 3
        word_attribute.split('"')[1].split(',').each do |synonym|
          Synonym.create!(word: current_word, word_synonym: synonym)
        end
      when 4
        puts 'No antonyms currently'
      when 5
        WordForm.create!(word: current_word, associated_word: word_attribute.split('"')[1])
      when 6
        WordForm.create!(word: current_word, associated_word: word_attribute.split('"')[1])
      when 7
        WordForm.create!(word: current_word, associated_word: word_attribute.split('"')[1])
      when 8
        WordForm.create!(word: current_word, associated_word: word_attribute.split('"')[1])
      when 9
        WordForm.create!(word: current_word, associated_word: word_attribute.split('"')[1])
      when 10
        word_attribute.split('"')[1].split(',').each do |root|
          current_word.word_roots.create(root_name: root)
        end
    end
  end
end