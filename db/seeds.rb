# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#No Dependincies
load 'db/seeds/users.rb'
load 'db/seeds/words.rb'
#load 'db/seeds/word_roots.rb'
load 'db/seeds/courses.rb'

#Dependincies <-- Order matters
load 'db/seeds/courses_users.rb' #Depends on Courses and Users
load 'db/seeds/lessons.rb' #Depends on course
load 'db/seeds/lesson_words.rb' #Depends on lessons and on words
load 'db/seeds/definitions.rb' #Depends on Words
load 'db/seeds/lesson_word_definitions.rb' #Depends on lesson_words and definitions



#load 'db/seeds/word_roots_words.rb' #Depends on words and word roots
