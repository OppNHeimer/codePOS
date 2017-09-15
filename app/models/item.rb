class Item < ApplicationRecord
	has_many :ingredients
	has_many :foods, through: :ingredients
end
