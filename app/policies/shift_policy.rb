class ShiftPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.admin?
        scope.all
      else
        scope.joins(:user_tasks).where(user_tasks: { user_id: user.id })
      end
    end
  end

  def update?
    user.admin?
  end
end
