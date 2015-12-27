class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.has_role? :admin
      can :manage, :all
    end

    if user.has_role?(:teacher)
      can [:create, :update, :show], Course
      can [:create, :update, :show], CourseEmail
      can [:create, :update, :show], Definition
      can [:create, :update, :show], Lesson
      can [:create, :update, :show], LessonModule
      can [:create, :update, :show], Sentence
      can [:create, :update, :show], Synonym
      can [:create, :update, :show], User
      can [:create, :update, :show], Word
      can [:create, :update, :show], WordForm
      can [:create, :update, :show], WordRoot
      can [:create, :update, :show], WordVideo
    end

    if user.has_role?(:student)
      can [:show], Course
      can [:show], Lesson
      can [:show], LessonModule
    end
  end
end
