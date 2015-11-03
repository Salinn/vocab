class UserMailer < ApplicationMailer
  default from: "team.vocabulary@gmail.com"

  def add_to_class_email(user)
    @user = user

    body_template = 'user_mailer/add_to_class'
    email_title = "You have been signed up for a class!"
    to_address = @user.email

    email_template(body_template, email_title, to_address)
  end

  def email_template(body_template, email_title, to_address)
    @body_template = body_template
    subject = email_title

    mail(to: to_address , subject: subject)
  end
end
