include BCrypt
class User < ActiveRecord::Base
  has_many :surveys
  has_many :records
  has_many :stats
  has_many :answers, through: :stats
  has_many :questions, through: :surveys
  #Validations
  validates :user, presence: true, length: { minimum: 4 }
  validates :email, presence: true
  validates :password, presence: true, length: { minimum: 4 }
  # Remember to create a migration!
   def password
    @password ||= Password.new(password_digest)
  end

  def password=(user_password)
    @password = Password.create(user_password)
    self.password_digest = @password
  end

  #Metodo de autenticación de passwords
  def self.authenticate(email, user_password)
    user = User.find_by(email: email)
    if user && (user.password == user_password)
      return user
    else
      nil
    end
  end

end
