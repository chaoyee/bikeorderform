class Model < ApplicationRecord
  has_and_belongs_to_many :sizes
  has_and_belongs_to_many :colors
  has_one :orderdetail

  validates_presence_of :name
  validates_uniqueness_of :name, message: "has existed!"
  validates :price, numericality: { greater_than_or_equal_to: 0 }
end
