class Ability
  include CanCan::Ability

  def initialize(user)
      user ||= User.new # guest user (not logged in)
      if user.admin?
        can :manage, :all
        can :access, :rails_admin #grant access to rails_admin
        can :dashboard #gives access to the dashboard

      else
        can :read, :all
      end
  end
end
