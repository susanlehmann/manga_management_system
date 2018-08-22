class Ability
  include CanCan::Ability

  def initialize(user, controller_namespace)
    user ||= User.new
    case controller_namespace
      when 'Admin'
        can :manage, :all if user.admin?
      else
        can :read, :all
        can :update, User,id: user.id
      end
  end
end
