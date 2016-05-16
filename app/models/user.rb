class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :avatar
  has_many :posts, dependent: :destroy
  has_many :topics, dependent: :destroy
  validates :name, :uniqueness => {:case_sensitive => false}, presence: true, length: { in: 2..10 }

  def self.pluck_fields
    [:id, :created_at, :updated_at, :name, :avatar_url, :posts_count, :rating, :banned]
  end

  def public_fields
    self.attributes.slice("id", "email", "rating", "name", "created_at", "updated_at", "posts_count")
  end
end
