class GradeModifer < ActiveRecord::Base
  belongs_to :user
  belongs_to :lesson
  belongs_to :course
  belongs_to :lesson_module
  #belongs_to :question

  def self.update_course_grade_for_all(user_ids, course_id, updated_grade_value)
    modifiers = GradeModifer.where("user_id IN (?) AND course_id = (?)", user_ids, course_id)
    modifiers.each do |modifier|
      modifier.update(modified_grade_value: updated_grade_value)
    end
  end

  def self.update_lesson_grade_for_all(user_ids, lesson_id, updated_grade_value)
    modifiers = GradeModifer.where("user_id IN (?) AND lesson_id = (?)", user_ids, lesson_id)
    modifiers.each do |modifier|
      modifier.update(modified_grade_value: updated_grade_value)
    end
  end

  def self.create_course_grade_for_all(user_ids, course_id, grade_modified_value, grade_modified)
    user_ids.each do |user_id|
      value = grade_modified[user_id] + grade_modified_value.to_i
      GradeModifer.create!(user_id: user_id, course_id: course_id, modified_grade_value: value)
    end
  end

  def self.create_lesson_grade_for_all(user_ids, lesson_id, grade_modified_value, grade_modified)
    user_ids.each do |user_id|
      value = grade_modified[user_id] + grade_modified_value.to_i
      GradeModifer.create!(user_id: user_id, lesson_id: lesson_id, modified_grade_value: grade_modified_value)
    end
  end
end
