class Topic < ActiveRecord::Base
  has_many :posts, dependent: :destroy
  belongs_to :theme, :counter_cache => true
  belongs_to :user, :counter_cache => true

  validates_presence_of :theme, :title, :content

  after_create do
    Post.create(title: title, content: content, user_id: user_id, theme_id: theme_id, topic_id: id)
  end

  def self.pluck_fields
    ["topics.id", "topics.title", "topics.last_post", "topics.posts_count", "users.id", "users.name", "themes.id", "themes.title"]
  end
end
