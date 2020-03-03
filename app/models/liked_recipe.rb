class LikedRecipe < ApplicationRecord
  belongs_to :user
  belongs_to :recipe

  include PgSearch::Model
  pg_search_scope :global_search,
    associated_against: {
      recipe: [:name, :dish_origin, :dish_type, :difficulty]
    },
    using: {
      tsearch: { prefix: true }
    }
end
