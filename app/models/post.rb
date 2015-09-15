class Post
  include Mongoid::Document
  field :title, type: String
  field :body, type: String
  belongs_to :user

  validates :title , presence: true
  validates :body , presence: true
end
