class Preference < ApplicationRecord
  belongs_to :user
  belongs_to :ingredient, dependent: :destroy
  validates_uniqueness_of :user_id, scope: :ingredient_id

end
