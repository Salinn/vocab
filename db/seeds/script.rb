puts 'started words'

require File.expand_path('../../../config/environment', __FILE__)

words = Hash.new{ |h, k| h[k] = [] }
lessons = []
word_roots = Hash.new{ |h, k| h[k] = [] }

x=0
files = Dir["../old_words/*"]

# #Word Roots
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
        word_root_attributes = word_roots[x]
        word_roots[x] = word_root_attributes.push line
      end
    end
  end
end
word_roots.each do |word_root|
  word_root.last.each_with_index do |word_root_attribute, index|
    puts word_root_attribute.split('"')[1]
    next if word_root_attribute.split('"')[1] == ""
    case index
      when 0
        current_word_root = WordRoot.find_or_create_by(root_name: word_root_attribute.split('"')[1])
      when 1
        current_word_root.update!(root_definition: word_root_attribute.split('"')[1])
    end
  end
end

x=0
files = Dir["../old_words/*"]

files.each do |file_name|
  unless File.directory? file_name
    File.open(file_name, "r") do |f|
      f.each_line do |line|
        if line =~ /var words/
          next if x == 0 || words == nil
          lessons.push(words)
          words = Hash.new{ |h, k| h[k] = [] }
          next
        elsif line =~ /new Array/
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
lesson_word = nil
lesson_number = 0
course = Course.create!(class_name: "Imported Course", start_date: Date.today, end_date: Date.today + 5.months)
lessons.each_with_index do |lesson_words, index|
  lesson = Lesson.create!(lesson_name: "Lesson #{index + 1}", lesson_points: 50, lesson_start_time: Date.today, lesson_end_date: Date.today + 7.days, course_id: course.id, penalty: 5)
  lesson_words.each do |word|
    puts word
    word.last.each_with_index do |word_attribute, index|
      next if word_attribute.split('"')[1] == "" || word_attribute.split('"')[1] == "none" || word_attribute.split('"')[1] == "+" || word_attribute.split("'")[1] == "" || word_attribute.split("'")[1] == "none" || word_attribute.split("'")[1] == "+"
      case index
        when 0
          word_name = word_attribute.split('"')[1].nil? ? word_attribute.split("'")[1].downcase : word_attribute.split('"')[1].downcase
          current_word = Word.find_or_create_by!(name: word_name)
          lesson_word = LessonWord.create!(lesson: lesson, word: current_word)
        when 1
          definition = Definition.create!(word_id: current_word.id, word_definition: word_attribute.split('"')[1])
          LessonWordDefinition.create!(lesson_word: lesson_word, definition: definition)
        when 2
          sentence = Sentence.create!(word_id: current_word.id, word_sentence: word_attribute.split('"')[1])
          LessonWordSentence.create!(lesson_word: lesson_word, sentence: sentence)
        when 3
          word_attribute.split('"')[1].split(',').each do |synonym|
            synonym = Synonym.create!(word_id: current_word.id, word_synonym: synonym)
            LessonWordSynonym.create!(lesson_word: lesson_word, synonym: synonym)
          end
        when 4
          puts 'No antonyms currently'
        when 5
          word_form = WordForm.create!(word_id: current_word.id, associated_word: word_attribute.split('"')[1])
          LessonWordForm.create!(lesson_word: lesson_word, word_form: word_form)
        when 6
          word_form = WordForm.create!(word_id: current_word.id, associated_word: word_attribute.split('"')[1])
          LessonWordForm.create!(lesson_word: lesson_word, word_form: word_form)
        when 7
          word_form = WordForm.create!(word_id: current_word.id, associated_word: word_attribute.split('"')[1])
          LessonWordForm.create!(lesson_word: lesson_word, word_form: word_form)
        when 8
          word_form = WordForm.create!(word_id: current_word.id, associated_word: word_attribute.split('"')[1])
          LessonWordForm.create!(lesson_word: lesson_word, word_form: word_form)
        when 9
          word_attribute.split('"')[1].split(',').each do |root|
            current_word.word_roots.find_or_create_by!(root_name: root)
          end
        when 10
          next
        else
          next
      end
    end
  end
end
