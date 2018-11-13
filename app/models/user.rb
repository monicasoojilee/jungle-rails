class User < ActiveRecord::Base
  has_secure_password
  has_many :review

  def self.authenticate_with_credentials(email, password)
    user = User.find_by_email(email)
    if user && user.authenticate(password)
      user
    else
      nil
    end
  end

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, uniqueness: { case_sensitive: false }
  validates :password_digest, length: { minimum: 6 }
  validates_confirmation_of :password_digest
end
