class Post
  belongs_to :user
  validates :title , presence: true , length: { minimum: 5, maximum: 20 }
  validates :body , presence: true, length: { minimum: 25, maximum: 120 }
end
