class PostPolicy
  def initialize(user, post)
    @user = user
    @post = post
  end

  def create?
    true
  end

  def update?
    ["admin", "moderator"].include?(@user.role) || @user.id == @post.user_id
  end

  def destroy?
    ["admin", "moderator"].include?(@user.role) || @user.id == @post.user_id
  end
end
