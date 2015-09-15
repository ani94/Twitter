class User
  include Mongoid::Document
  include ActiveModel::SecurePassword
  include Mongoid::Timestamps
  field :name, type: String
  field :email, type: String
  field :password_digest, type: String
  has_secure_password
  has_many :posts , dependent: :destroy

  has_many :relationships, foreign_key: "follower_id", dependent: :destroy
  has_many :followed_users, through: :relationships, source: :followed
  has_many :reverse_relationships, foreign_key: "followed_id", class_name:  "Relationship", dependent:   :destroy
  has_many :followers, through: :reverse_relationships, source: :follower

  before_save { self.email = email.downcase }



  # Validations
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :name , presence: true , length: {minimum: 6}
  validates :email , presence: true , length: {minimum: 6}, format: { with: VALID_EMAIL_REGEX }, uniqueness: true

  def follow(other_user)
    self.followed_users.create(followed_id: other_user.id)
  end

  def unfollow(other_user)
    self.followed_users.find_by(followed_id: other_user.id).destroy
  end

  def following?(other_user)
    followed_users.include?(other_user)
  end



end
