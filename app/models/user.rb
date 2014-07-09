class User < ActiveRecord::Base

  has_many :purchases, dependent: :destroy
  has_many :songs, through: :purchases

  # Add handlers to run when creating and saving
  before_create :create_remember_token
  before_save :normalize_fields

  # Validate name:
  validates :name,
    presence: true,
    length: { maximum: 50 }

  # Validate email address:
  validates :email,
    presence: true,
    uniqueness: { case_sensitive: false },
    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }

  # Validating positive balance
  validates :balance, numericality: { greater_than_or_equal_to: 0 }

  # Secure password features:
  has_secure_password

  # Create a new remember token for a user:
  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  # Hash a token:
  def User.hash(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  def purchase(song)
    if update(balance: balance - song.price)
      # Purchase.create(user_id: self.id, song_id: song.id)
      songs << song
    end
  end

  private

  # Creates a new session token for the user:
  def create_remember_token
    self.remember_token = User.hash(User.new_remember_token)
  end

  # Normalize fields for consistency:
  def normalize_fields
    self.email.downcase!
  end
end
