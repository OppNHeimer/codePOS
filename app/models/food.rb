class Food < ApplicationRecord
	has_many :ingredients
	has_many :items, through: :ingredients

	validates :name, :code, presence: true, uniqueness: true
end
