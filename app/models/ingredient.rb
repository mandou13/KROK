class Ingredient < ApplicationRecord
  belongs_to :recipe
  # validates  :unit, inclusion: { in: ['g', 'L', 'Teaspoon', 'Tablespoon' 'Pinch']}, presence: true
  validates  :name, presence: true
  validates  :quantity,  presence: true

  include PgSearch::Model
  pg_search_scope :search_by_ingredient,
    against: [ :name],
    using: {
      tsearch: { prefix: true }
    }
end
