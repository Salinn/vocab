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

  def add_options
    lesson_words = pick_words
    (answer_options.length..lesson_module.number_of_answers).each do
      #This is just a temp lesson word set until it gets really set in update_answer_options
      AnswerOption.create!(lesson_word_id: lesson_words.first, question: self)
    end
    update_answer_options(lesson_words)
  end

  def remove_options
    lesson_words = pick_words
    total_to_remove = answer_options.length - lesson_module.number_of_answers
    answer_options.each do  |answer_option|
      (total_to_remove == 0) ? answer_option.delete : total_to_remove =- 1
    end
    update_answer_options(lesson_words)
  end

  def update_answer_options(lesson_words)
    answer_options.each_with_index do |answer_option, index|
      answer_option.lesson_word_id = lesson_words[index-1]
    end
  end

  def pick_words
    lesson_words = lesson_module.lesson.lesson_words.pluck(:id).shuffle[0...(lesson_module.number_of_answers-1)]
    lesson_words.push(lesson_word.id)
    lesson_words.shuffle!
  end
end
