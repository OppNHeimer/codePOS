class Ingredient < ApplicationRecord
	has_many :includes
	has_many :items, through: :includes

	validates :name, :code, presence: true, uniqueness: true
end
