class Memo < ApplicationRecord

  #before_commit :authenticate_user!, except: [:index]


	has_many :comments

	has_many :favorites, dependent: :destroy

	belongs_to :user, dependent: :destroy

	has_many :liked_users, through: :favorites, source: :users

	validates :title, presence: true, length: { in: 1..30 }
  validates :body, presence: true, length: { in: 1..1000 }

  def already_liked?(memo)
    self.favorites.exists?(memo_id: memo.id)
  end
end
