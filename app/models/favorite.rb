class Favorite < ApplicationRecord
  #before_commit :authenticate_user!, only: [:create, :destroy]

	belongs_to :user, dependent: :destroy

	belongs_to :memo

  has_many :notifications, dependent: :destroy


  validates :user, presence: true
	validates_uniqueness_of :memo_id, scope: :user_id
  validates :memo, presence: true

end
