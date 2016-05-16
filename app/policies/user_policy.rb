class UserPolicy
  def initialize(user, topic)
    @user = user
    @topic = topic
  end

  def ban?
    ["admin", "moderator"].include?(@user.role)
  end
end
