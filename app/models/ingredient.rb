class Ingredient < ApplicationRecord
	belongs_to :food
	belongs_to :item
end
