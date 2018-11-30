class User < ApplicationRecord
  has_secure_password


 validates :studentId, presence: true, uniqueness: true
 validates :email, presence: true, uniqueness: true

#  devise :database_authenticatable, :registerable,
#         :recoverable, :rememberable, :validatable
#  serialize :google_api_token, Hash
end
