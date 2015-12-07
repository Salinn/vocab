class Question < ActiveRecord::Base
  belongs_to :lesson_module
  belongs_to :lesson_word
  has_many :answer_options
  has_many :answers

  validates :lesson_module_id, presence:true
  validates :lesson_word_id, presence:true
  after_create :create_answer_options

  def create_answer_options
    lesson_words = pick_words
    lesson_words.each do |current_lesson_word|
      AnswerOption.create!(lesson_word_id: current_lesson_word, question: self)
    end
  end

  def update_answer_options
    lesson_words = pick_words
    answer_options.each_with_index do |answer_option, index|
      answer_option.lesson_word_id = lesson_words[index-1].id
    end
  end

  def pick_words
    lesson_words = lesson_module.lesson.lesson_words.pluck(:id).shuffle[0...(lesson_module.number_of_answers-1)]
    lesson_words.push(lesson_word)
    lesson_words.shuffle!
  end
end
