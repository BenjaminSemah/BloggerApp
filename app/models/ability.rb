class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.admin?
      can :manage, :all
    else
      can :destroy, Post do |post|
        post.user_id == user.id
      end

      can :destroy, Comment do |comment|
        comment.user_id == user.id
      end

      can :create, Post do |_post|
        user.id
      end

      can :create, Comment do |_comment|
        user.id
      end

      can :read, :all
    end
  end
end
