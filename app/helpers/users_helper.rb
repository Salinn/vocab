module UsersHelper
  def first_name(user)
    user.first_name? ? user.first_name : 'N/A'
  end

  def last_name(user)
    user.last_name? ? user.last_name : 'N/A'
  end

  def user_name(user)
    first_name(user) + ' ' + last_name(user)
  end

  def email(user)
    user.email? ? user.email : 'N/A'
  end
end

