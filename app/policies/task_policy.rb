class TaskPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.admin?
        scope.all
      else
        scope.joins(:user_tasks).where(user_tasks: { user_id: user.id })
      end
    end
  end

  def index?
    user.present?
  end

  def show?
    user.present?
  end

  def new?
    user.admin?
  end

  def create?
    user.admin?
  end

  def toggle_completion?
    user.present?
  end

  def add_user?
    user.admin?
  end

  def remove_user_from_task?
    user.admin?
  end

  def update?
    user.admin?
  end

  def edit?
    user.admin?
  end

  def destroy?
    user.admin?
  end
  
  def calendar?
    user.present?
  end
end
