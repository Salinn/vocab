lessons = [
    {
        lesson_name: 'Lesson 1',
        lesson_points: 30,
        lesson_start_time: DateTime.now,
        lesson_end_date: DateTime.now + 1.week,
        course_id: 1,
        penalty: 10,
        lesson_modules: LessonModule.all
    },
    {
        lesson_name: 'Lesson 2',
        lesson_points: 30,
        lesson_start_time: DateTime.now + 1.week,
        lesson_end_date: DateTime.now + 2.weeks,
        course_id: 1,
        penalty: 10,
        lesson_modules: LessonModule.all
    },
    {
        lesson_name: 'Lesson 3',
        lesson_points: 30,
        lesson_start_time: DateTime.now + 2.weeks,
        lesson_end_date: DateTime.now + 3.weeks,
        course_id: 1,
        penalty: 10,
        lesson_modules: LessonModule.all
    },
    {
        lesson_name: 'Lesson 4',
        lesson_points: 30,
        lesson_start_time: DateTime.now + 3.weeks,
        lesson_end_date: DateTime.now + 4.weeks,
        course_id: 1,
        penalty: 10,
        lesson_modules: LessonModule.all
    },
    {
        lesson_name: 'Lesson 5',
        lesson_points: 30,
        lesson_start_time: DateTime.now + 4.weeks,
        lesson_end_date: DateTime.now + 5.week,
        course_id: 1,
        penalty: 10,
        lesson_modules: LessonModule.all
    }
]

Lesson.delete_all
Lesson.create!(lessons)