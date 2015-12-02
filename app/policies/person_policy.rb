class PersonPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def index?
    true
  end

  def new?
    user
  end

  def create?
    user
  end

  def edit?
    user
  end

  def update?
    user
  end

  def destroy?
    user
  end
end
