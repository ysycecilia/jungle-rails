class User < ActiveRecord::Base
  has_secure_password

  validates :firstname, :lastname, presence: true
  validates_uniqueness_of :email, case_sensitive: false, presence: true
  validates :password, presence: true
  validates :password_confirmation, presence: true
  validates :password, length: { minimum: 3 }

  def self.authenticate_with_credentials(email, password)
    down_case_email = email.downcase
    user = User.find_by(email: down_case_email.strip)
    if user && user.authenticate(password) 
      return user
    else
      return nil
    end
  end

end