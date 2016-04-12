class User < ActiveRecord::Base
  has_secure_password
  validates :email, presence: true, uniqueness: {case_sensitive: false}
  has_many :activities
  has_many :reviews
  has_many :skills
end
