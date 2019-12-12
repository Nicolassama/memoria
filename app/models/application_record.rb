class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

	#validates :name, presence: true
	#validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  #validates :title,    length: { in: 1..30 }
  #validates :body,    length: { in: 1..1000 }
end
