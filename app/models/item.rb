class Item < ApplicationRecord
	has_many :ingredients
	has_many :foods, through: :ingredients

	validates :name, :code, presence: true, uniqueness: true

end
