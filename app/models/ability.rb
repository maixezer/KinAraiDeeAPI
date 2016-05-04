class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    if user.has_role?(:god)
      can :manage, :all
    end

    if user.has_role?(:account_owner)
      can :read, Food
      can :read, Store
      can :manage, History, user_id: user.id
    end
  end
end
