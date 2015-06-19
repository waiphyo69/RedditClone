class User < ActiveRecord::Base
  after_initialize :ensure_session_token
  validates :username, :password_digest, :session_token, presence: true
  validates :password, length: {minimum: 6, allow_nil: true }
  attr_reader :password

  has_many :subs, class_name: 'Sub', foreign_key: :moderator_id
  has_many :posts, class_name: 'Post', foreign_key: :author_id 

  def self.find_by_credentials(username, password)
    user = User.find_by_username(username)
    if user && user.password_valid?(password)
      return user
    else
      return nil
    end
  end



  def reset_token
    self.session_token = SecureRandom.urlsafe_base64(16)
    self.save!
    self.session_token
  end

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end


  def password_valid?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  private
  def ensure_session_token
    self.session_token ||= SecureRandom.urlsafe_base64(16)
  end
end
