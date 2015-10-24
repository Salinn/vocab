require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the LessonsHelper. For example:
#
# describe LessonsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe LessonsHelper, type: :helper do
  let(:valid_lesson_attributes) {
    {
        lesson_name: 'Lesson 1',
        lesson_points: 30,
        lesson_start_time: DateTime.now,
        lesson_end_date: DateTime.now + 1.week,
        course: FactoryGirl.create(:course),
        penalty: 10
    }
  }

  let(:valid_word_attributes) {
    {
        name: 'Cactus',
    }
  }

  describe 'Generates Valid Lesson Link' do
    it "generates a link to one of the lesson words" do
      lesson = Lesson.create!(valid_lesson_attributes)
      word = Word.create!(valid_word_attributes)
      lesson_word = lesson.lesson_words.create!(word: word)
      expect(lesson_words_link(lesson_word)).to eql('<a href="/lesson_words/' + lesson_word.id.to_s + '">Cactus</a>')
    end
  end

  describe 'Generates Invalid Lesson Link' do
    it "does not create a link to one of the lesson words" do
      lesson = Lesson.create!(valid_lesson_attributes)
      lesson_word = lesson.lesson_words.build
      expect(lesson_words_link(lesson_word)).to eql('')
    end
  end
end
