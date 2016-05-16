class LessonsController
  class LessonUpdater
    attr_accessor :lesson

    def initialize(lesson)
      @lesson = lesson
    end

    def create
      if self.lesson.save
        self.create_modules
        self.create_lesson_event
      end
    end

    def create_modules
      graded_modules = ['Definition', 'Sentence', 'Synonym', 'Word Form']
      LessonModule.create!(name: 'Study the Word', attempts: 3, in_use: false, number_of_answers: 4, lesson_id: self.lesson.id, value_percentage: 0)

      graded_modules.each do |name|
        LessonModule.create!(name: name, attempts: 3, in_use: false, number_of_answers: 4, lesson_id: self.lesson.id, value_percentage: (100/graded_modules.length).round)
      end
    end

    def create_lesson_event
      Event.create!(lesson_id: self.lesson.id, title: self.lesson.lesson_name, description: "Due date for lesson", start_time: self.lesson.lesson_start_time, end_time: self.lesson.lesson_end_date)
    end
  end
end