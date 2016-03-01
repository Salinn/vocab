class UserMailer < ApplicationMailer
  default from: "team.vocabulary@gmail.com"

  def add_to_class_email(course, user, raw_token)
    @course = course
    @user = user
    @token = raw_token

    body_template = 'user_mailer/add_to_class'
    email_title = "You have been signed up for the following class: #{@course.class_name}!"
    to_address = @user.email

    email_template(body_template, email_title, to_address, nil)
  end

  def custom_email(recipient, email_title, message, teacher_email)
    @recipient = recipient
    @message = message
    @email_title = email_title
    mail(to: recipient, subject: email_title, cc: teacher_email)
  end

  def email_template(body_template, email_title, to_address, cc_email)
    @body_template = body_template
    subject = email_title
    mail to: to_address, subject: subject, cc: cc_email
  end
end
