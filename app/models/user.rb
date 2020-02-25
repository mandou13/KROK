class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :recipes
  has_many :planners
  has_many :liked_recipes
  has_many :ratings
  has_many :planner_recipes, through: :planners
  has_many :shopping_lists, through: :planners

end
