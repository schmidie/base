# frozen_string_literal: true

class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all if user.admin?
    end
  end

  def index?
    user.admin?
  end

  def show?
    user.admin? || user == record
  end

  def update?
    user.admin?
  end

  def destroy?
    return false if user == record
    user.admin?
  end
end
