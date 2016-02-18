class Ability
  include CanCan::Ability
  def initialize(user)
    if user.admin? then
      can :manage, :all
    else
      can [:update, :read], AdminUser, :id => user.id
      if user.roles.include? "O" then
        #rol d'omic
        can :manage, OmicQuery, :admin_user_id => user.id
        can :manage, OmicClaim, :admin_user_id => user.id
        can :read, AdminUser, :id => user.id
        can :read, OmicSector
        can :read, OmicService
        can :read, OmicReason
        can :read, OmicMean
        can :read, OmicResult
        can :read, OmicAge
        can :read, CommonIdType
        can :manage, OmicPetitioner
        can :manage, OmicSituation
        can :manage, OmicReclaimed
      elsif user.roles.include? "A" then
      #rol de control d'accessos
      end

      #Everyone can see Dashboard
      can :read, ActiveAdmin::Page, :name => "Dashboard"
    end
  # Define abilities for the passed in user here. For example:
  #
  #   user ||= User.new # guest user (not logged in)
  #   if user.admin?
  #     can :manage, :all
  #   else
  #     can :read, :all
  #   end
  #
  # The first argument to `can` is the action you are giving the user
  # permission to do.
  # If you pass :manage it will apply to every action. Other common actions
  # here are :read, :create, :update and :destroy.
  #
  # The second argument is the resource the user can perform the action on.
  # If you pass :all it will apply to every resource. Otherwise pass a Ruby
  # class of the resource.
  #
  # The third argument is an optional hash of conditions to further filter the
  # objects.
  # For example, here the user can only update published articles.
  #
  #   can :update, Article, :published => true
  #
  # See the wiki for details:
  # https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end