class User < ActiveRecord::Base
  has_many :story_users
  has_many :stories,
    through: :story_users

  validates_presence_of :username, :email
  validates_uniqueness_of :username, :email
  # validate format of email
  # validate length of username
end
