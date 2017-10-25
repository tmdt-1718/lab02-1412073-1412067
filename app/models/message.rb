class Message < ApplicationRecord
  belongs_to :user
	validates :text, presence: true
	validates :receiver, presence: true
end
