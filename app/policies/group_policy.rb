class GroupPolicy
  def initialize(user, group)
    @user = user
    @group = group
  end

  def create?
    @user.role == "admin"
  end

  def update?
    @user.role == "admin"
  end

  def destroy?
    @user.role == "admin"
  end
end
