class QuestionsController
  class QuestionUpdater
    attr_accessor :question

    def initialize(question)
      @question = question
    end

    def create
      if self.question.save
        self.create_answer_options
      end
    end

    def create_answer_options
      return if self.question.lesson_module.lesson.lesson_words.length < self.question.lesson_module.number_of_answers
      lesson_words = self.pick_words
      if self.question.question_string =~ /Study the Word/
        question_type = self.question.question_string.split('-').last.strip
        self.question.update_columns(question_string: "What is the correct #{question_type} for the word #{lesson_word.word.name}")
        lesson_words = pick_words_definitions if question_type == 'definition'
        lesson_words = pick_words_word_forms if question_type == 'word form'
        lesson_words = pick_words_synonyms if question_type == 'synonym'
        lesson_words = pick_words_sentences if question_type == 'sentence'
        lesson_words.each do |current_lesson_word|
          answer_option = AnswerOption.create!(lesson_word_id: current_lesson_word, question: self)
          self.question.update_columns(answer_options_id: answer_option.id) if current_lesson_word == self.question.lesson_word.id
        end
      elsif self.question.question_string =~ /Pretest/
        self.question.update_columns(question_string: "Do you know the #{lesson_word.word.name} word?")
      else
        lesson_words = pick_words
        lesson_words.each do |current_lesson_word|
          answer_option = AnswerOption.create!(lesson_word_id: current_lesson_word, question: self.question)
          self.question.update_columns(answer_options_id: answer_option) if current_lesson_word == self.question.lesson_word.id
        end
      end
    end

    def add_options
      lesson_words = pick_words
      (answer_options.length..self.question.lesson_module.number_of_answers).each do
        #This is just a temp lesson word set until it gets really set in update_answer_options
        AnswerOption.create!(lesson_word_id: lesson_words.first, question: self)
      end
      update_answer_options(lesson_words)
    end

    def remove_options
      lesson_words = pick_words
      total_to_remove = answer_options.length - self.question.lesson_module.number_of_answers
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

    def update_words_picked(lesson_words, lesson_word)
      while lesson_words.include?(lesson_word.id) && lesson_words.uniq.length == lesson_words.length
        lesson_words.delete(lesson_word.id)
        lesson_words.push(self.question.lesson_module.lesson.lesson_words.pluck(:id).shuffle.first)
      end
      lesson_words
    end

    def pick_words
      lesson_words = self.question.lesson_module.lesson.lesson_words.pluck(:id).shuffle[0...(self.question.lesson_module.number_of_answers-1)]
      lesson_words = update_words_picked(lesson_words, self.question.lesson_word) if lesson_words.include?(self.question.lesson_word.id)
      lesson_words.push(self.question.lesson_word.id)
      lesson_words.shuffle!
    end

    def pick_words_definitions
      lesson_words_with_definitions = []
      lesson_words = self.question.lesson_module.lesson.lesson_words.each do | current_lesson_word |
        lesson_words_with_definitions.push(current_lesson_word.id)  if (current_lesson_word.definitions.any? && current_lesson_word.id != lesson_word.id)
      end
      return false if lesson_words_with_definitions.empty?
      lesson_words = lesson_words_with_definitions.shuffle[0...(self.question.lesson_module.number_of_answers-1)]
      lesson_words.push(lesson_word.id)
      lesson_words.shuffle!
    end

    def pick_words_word_forms
      lesson_words_with_word_forms = []
      self.question.lesson_module.lesson.lesson_words.each do | current_lesson_word |
        lesson_words_with_word_forms.push(current_lesson_word.id)  if (current_lesson_word.word_forms.any? && current_lesson_word.id != lesson_word.id)
      end
      return false if lesson_words_with_word_forms.empty?
      lesson_words = lesson_words_with_word_forms.shuffle[0...(self.question.lesson_module.number_of_answers-1)]
      lesson_words.push(lesson_word.id)
      lesson_words.shuffle!
    end

    def pick_words_synonyms
      lesson_words_with_synonyms = []
      self.question.lesson_module.lesson.lesson_words.each do | current_lesson_word |
        lesson_words_with_synonyms.push(current_lesson_word.id)  if (current_lesson_word.synonyms.any? && current_lesson_word.id != lesson_word.id)
      end
      return false if lesson_words_with_synonyms.empty?
      lesson_words = lesson_words_with_synonyms.shuffle[0...(self.question.lesson_module.number_of_answers-1)]
      lesson_words.push(lesson_word.id)
      lesson_words.shuffle!
    end

    def pick_words_sentences
      lesson_words_with_sentences = []
      self.question.lesson_module.lesson.lesson_words.each do | current_lesson_word |
        lesson_words_with_sentences.push(current_lesson_word.id)  if (current_lesson_word.sentences.any? && current_lesson_word.id != lesson_word.id)
      end
      return false if lesson_words_with_sentences.empty?
      lesson_words = lesson_words_with_sentences.shuffle[0...(self.question.lesson_module.number_of_answers-1)]
      lesson_words.push(lesson_word.id)
      lesson_words.shuffle!
    end
  end
end