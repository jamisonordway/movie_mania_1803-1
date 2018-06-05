class User < ApplicationRecord
  has_secure_password
  validates :username, uniqueness: true, presence: true


  enum role: %w(default admin)
end
