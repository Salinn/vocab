class CourseEmail < ActiveRecord::Base
  belongs_to :course
  belongs_to :user

  validates :title, length: { minimum: 4 }
  validates :content, length: { minimum: 10 }

  after_create :send_email

  def send_email
    teacher_email = User.with_role(:teacher, course).first.email
    if user_id.nil?
      send_class_email(teacher_email)
    else
      UserMailer.custom_email(user, title, content, teacher_email).deliver_later
    end
  end

  def send_class_email(teacher_email)
    return if course.nil? || course.users.empty?
    course.users.each do |user|
      next if user.id == nil || user.has_role?(:teacher, course)
      UserMailer.custom_email(user, title, content, teacher_email).deliver_later
    end
  end
end
