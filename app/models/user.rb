class User < ActiveRecord::Base
  has_secure_password

  attr_accessible :email, :password, :password_confirmation
  has_many :questions
  has_many :answers

  validates_uniqueness_of :email
end
