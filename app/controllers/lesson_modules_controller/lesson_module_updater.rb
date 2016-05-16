require "#{Rails.root}/app/controllers/questions_controller/question_updater"

class LessonModulesController
  class LessonModuleUpdater
    attr_accessor :lesson_module, :params

    def initialize(lesson_module, params)
      @lesson_module = lesson_module
      @params = params
    end

    def update
      if self.lesson_module.update(self.params)
        self.create_questions
      end
    end

    def create_questions
      if self.lesson_module.in_use?
        self.lesson_module.lesson.lesson_words.each do |lesson_word|
          unless self.lesson_module.questions.map(&:lesson_word_id).include? lesson_word.id
            question = generate_question(lesson_word)
            next if question == 'skip'
            if question == 'Study the Word'
              study_the_word(lesson_word)
            else
              create_question(lesson_word, question)
            end
          end
        end
      end
    end

    def generate_question(lesson_word)
      case self.lesson_module.name
        when 'Word Form'
          question = lesson_word.word_forms.any? ? lesson_word.word_forms.first.associated_word : 'skip'
        when 'Definition'
          question = lesson_word.definitions.any? ? lesson_word.definitions.first.word_definition : 'skip'
        when 'Synonym'
          question = lesson_word.synonyms.any? ? lesson_word.synonyms.first.word_synonym : 'skip'
        when 'Sentence'
          question = lesson_word.sentences.any? ? lesson_word.sentences.first.word_sentence.gsub(/#{lesson_word.word.name}/i, '______') : 'skip'
        when 'Study the Word'
          question = lesson_word ? 'Study the Word': 'skip'
        else
          question = 'skip'
      end
      question
    end

    def study_the_word(lesson_word)
      create_question(lesson_word, 'Study the Word - definition') if lesson_word.definitions.any?
      create_question(lesson_word, 'Study the Word - word form') if lesson_word.word_forms.any?
      create_question(lesson_word, 'Study the Word - synonym') if lesson_word.synonyms.any?
      create_question(lesson_word, 'Study the Word - sentence') if lesson_word.sentences.any?
    end

    def create_question(lesson_word, question_string)
      question = Question.create!(lesson_word: lesson_word, lesson_module: self.lesson_module, question_string: question_string)
      @question_updater = QuestionsController::QuestionUpdater.new(question)
      @question_updater.create
    end
  end
end