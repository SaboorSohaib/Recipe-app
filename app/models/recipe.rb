class Recipe < ApplicationRecord
  belongs_to :user
  has_many :foods, through: :recipes_foods
  has_many :recipe_foods, dependent: :destroy
end
