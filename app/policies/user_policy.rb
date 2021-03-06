class UserPolicy < ApplicationPolicy

  class Scope < UserPolicy

    def initialize(user, scope)
      @user  = user
      @scope = scope
    end

     def resolve
       if @user.admin?
         @scope.all
       else
         @scope.where(:id => @user.id)
       end
     end
    end


  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    @user.admin? || @record.try(:id) == @user.id
  end

  def create?
    @user.admin? || @record.try(:id) == @user.id
  end

  def show?
    @user.admin? || @record.try(:id) == @user.id
  end

  def update?
    @user.admin? || @record.try(:id) == @user.id
  end

  def destroy?
    @user.admin?
  end

end
