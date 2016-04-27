start_time = Time.new
puts "\nSeeding has begun\n"

if Rails.env == "development"
  load 'db/seeds/users.rb'
  load 'db/seeds/words.rb'
  load 'db/seeds/word_roots.rb'
  load 'db/seeds/courses.rb'


#Dependincies <-- Order matters
  load 'db/seeds/lessons.rb' #Depends on course and lesson_modules
  load 'db/seeds/lesson_words.rb' #Depends on lessons and on words
  load 'db/seeds/definitions.rb' #Depends on Words
  load 'db/seeds/sentences.rb'   #Depends on Words
  load 'db/seeds/synonyms.rb'   #Depends on Words
  load 'db/seeds/word_videos.rb'   #Depends on Words
  load 'db/seeds/lesson_word_definitions.rb' #Depends on lesson_words and definitions
  load 'db/seeds/word_roots_words.rb' #Depends on words and root words

  load 'db/seeds/full_course_examples.rb'

  load 'db/seeds/word_roots_words.rb' #Depends on words and word roots
  puts 'Seeding in development'
elsif Rails.env == "production"
  load 'db/seeds/users.rb'
  puts 'Seeding in production'
end

end_time = Time.new

puts "\nSeeding has completed in #{(end_time-start_time)} seconds\n"

