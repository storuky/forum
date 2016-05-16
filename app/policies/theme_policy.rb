class ThemePolicy
  def initialize(user, theme)
    @user = user
    @theme = theme
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
