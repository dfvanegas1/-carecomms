class TaskPolicy < ApplicationPolicy
  class Scope < Scope
    attr_reader :user, :task

    # NOTE: Be explicit about which records you allow access to!
    def initialize(user, task)
      @user = user
      @task = task
    end

    def resolve
      user.admin? ? scope.all : scope.where(user: user)
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
end
