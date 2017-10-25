class User < ApplicationRecord
	has_many :messages, dependent: :destroy
	has_many :friendships
 	has_many :friends, :through => :friendships
  validates :name, presence: true
	validates :email, presence: true
	validates :password, presence: true

end
