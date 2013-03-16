class User < ActiveRecord::Base
  #has_secure_password

  attr_accessible :email, :password, :password_confirmation
  has_many :questions
  has_many :answers

  validates_uniqueness_of :email

  def self.from_omniauth(auth)
    where(auth.slice("provider", "uid")).first || create_from_omniauth(auth)
  end
  
  def self.create_from_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.email = auth["info"]["email"]
    end
  end
end
