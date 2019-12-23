class Comment < ApplicationRecord

	belongs_to :user

	belongs_to :memo

  has_many :notifications, dependent: :destroy

end
