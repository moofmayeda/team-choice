class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, :all
    can :create, :pin
  end
end
