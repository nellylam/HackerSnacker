require 'bcrypt'

class User < ActiveRecord::Base
  has_many :story_users
  has_many :stories,
    through: :story_users

  validates_presence_of :username, :email
  validates_uniqueness_of :username, :email
  # validate format of email
  # validate length of username

  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

end
