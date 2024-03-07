class UserShiftPolicy < ApplicationPolicy
  class Scope < Scope
  end

  def update?
    user.admin?
  end
end
