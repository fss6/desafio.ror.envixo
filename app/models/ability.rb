# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    # abort user. admin?.inspect
    if user.present?
      if user.admin?
        can :manage, :all
      end
    end
  end
end
