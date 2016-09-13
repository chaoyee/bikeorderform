class Size < ApplicationRecord
  has_and_belongs_to_many :models
  has_one :orderdetail

  validates_presence_of :name
  validates_uniqueness_of :name, message: "has existed!"

  default_scope -> { order("name ASC") }
end
