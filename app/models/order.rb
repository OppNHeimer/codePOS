class Order < ApplicationRecord
  validates :item, presence: true
end
