class Item < ApplicationRecord
	has_many :includes
	has_many :ingredients, through: :includes
	belongs_to :category

	validates :name, :code, presence: true, uniqueness: true

end
