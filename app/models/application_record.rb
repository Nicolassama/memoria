class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
 


	#validates :name, presence: true
	#validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }

end
