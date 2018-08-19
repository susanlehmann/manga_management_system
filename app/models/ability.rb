class Ability
  include CanCan::Ability

  def initialize(user, controller_namespace)
    user ||= User.new
    case controller_namespace
      when 'Admin'
        if user.admin?
          can :manage, :all
        end
      else
        can :read, :all
        can :update, User,id: user.id
      end
  end
end
