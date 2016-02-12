class Question < ActiveRecord::Base
  belongs_to :lesson_module
  belongs_to :lesson_word
  has_many :answer_options
  has_many :answers

  validates :lesson_module_id, presence:true
  validates :lesson_word_id, presence:true
  after_create :create_answer_options

  def create_answer_options
    if question_string =~ /Study the Word/
      question_type = question_string.split('-').last
      self.question_string = "What is the correct #{question_type} for the word #{lesson_word.word.name}"
      lesson_words = pick_words_definitions if question_type == 'definition'
      lesson_words = pick_words_word_forms if question_type == 'word form'
      lesson_words = pick_words_synonyms if question_type == 'synonym'
      lesson_words = pick_words_sentences if question_type == 'sentence'
      lesson_words.each do |current_lesson_word|
        AnswerOption.create!(lesson_word_id: current_lesson_word, question: self)
      end
    elsif question_string =~ /Pretest/
      return
    else
      lesson_words = pick_words
      lesson_words.each do |current_lesson_word|
        AnswerOption.create!(lesson_word_id: current_lesson_word, question: self)
      end
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

  def update_all_answer_options
    lesson_words = pick_words
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

  def pick_words_definitions
    lesson_words = lesson_module.lesson.lesson_words.definitions.pluck(:id).shuffle[0...(lesson_module.number_of_answers-1)]
    lesson_words.push(lesson_word.definitions.first.id)
    lesson_words.shuffle!
  end

  def pick_words_word_forms
    lesson_words = lesson_module.lesson.lesson_words.word_forms.pluck(:id).shuffle[0...(lesson_module.number_of_answers-1)]
    lesson_words.push(lesson_word.word_forms.first.id)
    lesson_words.shuffle!
  end

  def pick_words_synonyms
    lesson_words = lesson_module.lesson.lesson_words.synonyms.pluck(:id).shuffle[0...(lesson_module.number_of_answers-1)]
    lesson_words.push(lesson_word.synonyms.first.id)
    lesson_words.shuffle!
  end

  def pick_words_sentences
    lesson_words = lesson_module.lesson.lesson_words.sentences.pluck(:id).shuffle[0...(lesson_module.number_of_answers-1)]
    lesson_words.push(lesson_word.sentences.first.id)
    lesson_words.shuffle!
  end
end