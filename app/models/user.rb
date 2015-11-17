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