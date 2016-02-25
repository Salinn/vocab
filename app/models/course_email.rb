class CourseEmail < ActiveRecord::Base
  belongs_to :course
  has_and_belongs_to_many :users

  validates :title, length: { minimum: 4 }
  validates :content, length: { minimum: 10 }

  after_create :custom_email

  def custom_email(recipients, email_title, message)
    teacher_email = User.with_role(:teacher, course).first.email
    @recipients = recipients
    @recipients.each do |recipient|
      @recipient = recipient.user_email
      @message = message
      @email_title = email_title
      body_template = 'user_mailer/custom_email'
      email_template(body_template, email_title, @recipient, teacher_email)
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
