class Memo < ApplicationRecord

	has_many :comments

	has_many :favorites

	belongs_to :users
end
