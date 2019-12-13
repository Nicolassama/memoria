class Contact < ApplicationRecord

	belongs_to :users



 	#validates :name, presence: true

	#validates :email, presence: true, length: {maximum:255},
                    #format: {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i}
	#validates :title, presence: true

 	#validates :body, presence: true

end
