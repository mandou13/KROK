class Recipe < ApplicationRecord
  belongs_to :user
  has_many   :ingredients
  has_many   :planner_recipes
  has_many   :liked_recipes
  has_many   :ratings

  validates  :name, presence: true
  validates  :description, presence: true, uniqueness: true
  validates  :dish_type, inclusion: { in: ['dessert', 'starter', 'appetizer', 'side', 'snack', 'main'] }
  validates  :dish_origin, inclusion: { in: ['Italian', 'Mexican', 'British', 'Indian', 'French', 'Greek', 'English', 'Chinese',  'Middle East', 'Thai', 'Vietnamese', 'Spanish',  'Asian', 'Korean', 'American', 'German'] }
  validates  :prep_time, presence: true
  validates  :servings, presence: true
  validates  :difficulty, inclusion: { in: ['Easy', 'Medium', 'Hard'] }


  has_one_attached :photo

  def rating
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

  def already_rated?(user)
    user.ratings.each do |rate|
      return true if rate.recipe == self
    end
    return false
  end
end
