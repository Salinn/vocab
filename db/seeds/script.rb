puts 'started words'

require File.expand_path('../../../config/environment', __FILE__)

words = Hash.new{ |h, k| h[k] = [] }
word_roots = Hash.new{ |h, k| h[k] = [] }
x=0
files = Dir["../old_words/*"]
files.each do |file_name|
  unless File.directory? file_name
    File.open(file_name, "r") do |f|
      f.each_line do |line|
        if line =~ /new Array/
          x += 1
          next
        end
        puts line
        word_attributes = words[x]
        words[x] = word_attributes.push line
      end
    end
  end
end
current_word = nil
words.each do |word|
  puts word
  word.last.each_with_index do |word_attribute, index|
    puts word_attribute.split('"')[1]
    case index
      when 0
        current_word = Word.find_or_create_by!(name: word_attribute.split('"')[1].downcase)
      when 1
        Definition.create!(word_id: current_word.id, word_definition: word_attribute.split('"')[1])
      when 2
        Sentence.create!(word_id: current_word.id, word_sentence: word_attribute.split('"')[1])
      when 3
        word_attribute.split('"')[1].split(',').each do |synonym|
          Synonym.create!(word_id: current_word.id, word_synonym: synonym)
        end
      when 4
        puts 'No antonyms currently'
      when 5
        next if word_attribute.split('"')[1] == ""
        WordForm.create!(word_id: current_word.id, associated_word: word_attribute.split('"')[1])
      when 6
        next if word_attribute.split('"')[1] == ""
        WordForm.create!(word_id: current_word.id, associated_word: word_attribute.split('"')[1])
      when 7
        next if word_attribute.split('"')[1] == ""
        WordForm.create!(word_id: current_word.id, associated_word: word_attribute.split('"')[1])
      when 8
        next if word_attribute.split('"')[1] == ""
        WordForm.create!(word_id: current_word.id, associated_word: word_attribute.split('"')[1])
      when 9
        next if word_attribute.split('"')[1] == ""
        WordForm.create!(word_id: current_word.id, associated_word: word_attribute.split('"')[1])
      when 10
        word_attribute.split('"')[1].split(',').each do |root|
          #current_word.word_roots.create(root_name: root)
        end
    end
  end
end

#Word Roots
current_word_root = nil
files = Dir["../old_word_roots/*"]
files.each do |file_name|
  unless File.directory? file_name
    File.open(file_name, "r") do |f|
      f.each_line do |line|
        if line =~ /new Array/
          x += 1
          next
        end
        word_root_attributes = words[x]
        word_roots[x] = word_root_attributes.push line
      end
    end
  end
end
word_roots.each do |word_root|
  puts word_roots
  word_root.last.each_with_index do |word_root_attribute, index|
    case index
      when 0
        current_word_root = WordRoot.create!(root_name: word_attribute.split('"')[1])
      when 1
        current_word_root.update!(root_definition: word_attribute.split('"')[1])
    end
  end
end