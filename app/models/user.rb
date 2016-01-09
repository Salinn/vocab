class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :course_users
  has_many :courses, through: :course_users

  def name
    "#{first_name} #{last_name}"
  end

  def name_and_email
    "#{first_name} #{last_name} - #{email}"
  end

  def delete_role(role_symbol,target=nil)
    UsersRoles.delete_role self,role_symbol,target
  end

  def users_classes(role_name)
    Course.with_role(role_name, self)
  end

  def new_user_added_to_course(course)
    raw_token, hashed_token = Devise.token_generator.generate(User, :reset_password_token)
    self.reset_password_token = hashed_token
    self.reset_password_sent_at = Time.now.utc
    self.password = Devise.friendly_token.first(8)
    self.save
    self.add_role :student, course
    UserMailer.add_to_class_email(course, self, raw_token).deliver_later
  end

  def new_user_added_to_website(role)
    raw_token, hashed_token = Devise.token_generator.generate(User, :reset_password_token)
    self.reset_password_token = hashed_token
    self.reset_password_sent_at = Time.now.utc
    self.password = Devise.friendly_token.first(8)
    self.save
    self.add_role role
    #TODO Add an email to let people know they were added to a class
    #UserMailer.add_to_class_email(course, self, raw_token).deliver_later
  end
end


class UsersRoles < ActiveRecord::Base

  def self.delete_role(subject,role_symbol, obj=nil)
    res_name = obj.nil? ? nil : obj.class.name
    res_id   = obj.id rescue nil
    role_row = subject.roles.where(name: role_symbol.to_s, resource_type: res_name , resource_id: res_id).first
    if  role_row.nil?
      raise "cannot delete nonexisting role on subject"
    end
    role_id = role_row.id
    self.delete_all(user_id: subject.id,role_id: role_id)
  end

  private_class_method :new
end