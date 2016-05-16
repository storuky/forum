class Group < ActiveRecord::Base
  has_many :themes, ->{order(:id)}, dependent: :destroy
  has_many :topics, through: :themes, dependent: :destroy
  has_many :posts, through: :topics, dependent: :destroy

  def self.pluck_fields
    ["groups.id", "groups.title", "themes.id", "themes.title", "themes.posts_count", "themes.topics_count", "themes.last_post"]
  end
end
