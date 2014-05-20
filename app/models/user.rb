class User < ActiveRecord::Base
  before_save :normalize_fields

  validates :name,
    presence: true,
    length: { maximum: 50 }

  # Validate email address:
  validates :email,
    presence: true,
    uniqueness: { case_sensitive: false },
    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }

  validates :password,
    length: { minimum: 8 }

  has_secure_password

  # Crypto methods for working with passwords

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.hash(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private

  def normalize_fields
    self.email.downcase!
  end
end