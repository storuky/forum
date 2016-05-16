class TopicPolicy
  def initialize(user, topic)
    @user = user
    @topic = topic
  end

  def create?
    true
  end

  def update?
    @user.id == @topic.user_id || ["admin", "moderator"].include?(@user.role)
  end

  def destroy?
    @user.id == @topic.user_id || ["admin", "moderator"].include?(@user.role)
  end
end
