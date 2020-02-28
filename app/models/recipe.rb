class Recipe < ApplicationRecord
  belongs_to :user
  has_many   :ingredients
  has_many   :planner_recipes
  has_many   :liked_recipes
  has_many   :ratings

  validates  :name, presence: true
  validates  :description, presence: true, uniqueness: true
  validates  :dish_type, inclusion: { in: ['dessert', 'starter', 'main'] }
  validates  :dish_origin, inclusion: { in: ['Italian', 'Mexican', 'British', 'Indian', 'French', 'Greek', 'English', 'Chinese',  'Middle East', 'Thai', 'Vietnamese', 'Spanish',  'Asian', 'Korean', 'American', 'German'] }
  validates  :prep_time, presence: true
  validates  :servings, presence: true
  validates  :difficulty, inclusion: { in: ['Easy', 'Medium', 'Hard'] }


  has_one_attached :photo

  include PgSearch::Model
  pg_search_scope :search_by_name_origin_dish_type_and_difficulty,
    against: [ :name, :dish_origin, :dish_type, :difficulty ],
    using: {
      tsearch: { prefix: true }
    }

  def avg_rating
    sum = 0
    self.ratings.each do |rating|
      sum += rating.rating
    end
    self.ratings.size == 0 ? 0 : (sum / self.ratings.size)
  end

  def liked?(user)
    answer = []
    self.liked_recipes.each do |liked_recipe|
      answer << (liked_recipe.user.id == user.id)
    end
    answer.include?(true)
  end

  def already_rated?(user)
    user.ratings.each do |rate|
      return true if rate.recipe == self
    end
    return false
  end

  def categories_of_recipe
    categories = []
    self.ingredients.each do |ingredient|
      categories << ingredient.category
    end
    return categories.uniq
  end

end
