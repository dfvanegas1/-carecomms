class UserTaskPolicy < ApplicationPolicy
  class Scope < Scope
  end

  def remove_user_from_task?
    user.admin?
  end

  def destroy?
    remove_user_from_task?
  end
end
