class LessonModule < ActiveRecord::Base

  belongs_to :lesson
  has_many :questions

  validates :name, length: { minimum: 4 }
  validates :attempts, numericality: { greater_than_or_equal_to: 0 }
  validates :in_use, inclusion: { in: [true, false] }
  validates :value_percentage, numericality: { greater_than_or_equal_to:0, less_than_or_equal_to: 100 }
  validate :check_if_answer_exists, on: :update
  validate :check_if_enough_lesson_words, on: :update

  after_update :create_questions
  before_save :check_for_answers, :number_of_answers_changed

  def create_questions
    if in_use?
      lesson.lesson_words.each do |lesson_word|
        unless questions.map(&:lesson_word_id).include? lesson_word.id
          question = generate_question(lesson_word)
          next if question == 'skip'
          if question == 'Study the Word'
            study_the_word(lesson_word)
          elsif question == 'Pretest'
            pretest(lesson_word)
          else
            Question.create!(lesson_word: lesson_word, lesson_module: self, question_string: question)
          end
        end
      end
    end
  end

  def pretest(lesson_word)
    Question.create!(lesson_word: lesson_word, lesson_module: self, question_string: 'Pretest')
  end

  def study_the_word(lesson_word)
    Question.create!(lesson_word: lesson_word, lesson_module: self, question_string: 'Study the Word - definition') if lesson_word.definitions.any?
    Question.create!(lesson_word: lesson_word, lesson_module: self, question_string: 'Study the Word - word form') if lesson_word.word_forms.any?
    Question.create!(lesson_word: lesson_word, lesson_module: self, question_string: 'Study the Word - synonym') if lesson_word.synonyms.any?
    Question.create!(lesson_word: lesson_word, lesson_module: self, question_string: 'Study the Word - sentence') if lesson_word.sentences.any?
  end

  def check_if_answer_exists
    questions.each do |question|
      return false if question.answers.any?
    end
    return true
  end

  def check_if_enough_lesson_words
    unless check_if_answer_exists
      return (lesson.lesson_words.length > number_of_answers) ? true : false
    end
    return true
  end

  def check_for_answers
    if number_of_answers_changed? || attempts_changed?
      unless check_if_answer_exists
        errors.add(:lesson_module, 'This Module Cannot be changed if')
        return false
      end
    end
    return true
  end

  def number_of_answers_changed
    if number_of_answers_changed?
      update_answer_options
    end
  end

  def update_answer_options
    questions.each do |question|
      (number_of_answers > number_of_answers_was) ? question.add_options : question.remove_options
    end
  end

  def lesson_update_answer_options
    questions.each do |question|
      question.update_all_answer_options
    end
  end

  def generate_question(lesson_word)
    if name == 'Word Form'
      return lesson_word.word_forms.any? ? lesson_word.word_forms.first.associated_word : 'skip'
    elsif name == 'Definition'
      return lesson_word.definitions.any? ? lesson_word.definitions.first.word_definition : 'skip'
    elsif name == 'Synonym'
      return lesson_word.synonyms.any? ? lesson_word.synonyms.first.word_synonym : 'skip'
    elsif name == 'Sentence'
      return lesson_word.sentences.any? ? lesson_word.sentences.first.word_sentence.gsub(/#{lesson_word.word.name}/i, '______') : 'skip'
    elsif name == 'Pretest'
      return (lesson_word.lesson.lesson_words.length > 4) ? 'Pretest' : 'skip'
    elsif name == 'Study the Word'
      return lesson_word ? 'Study the Word': 'skip'
    end
  end
end