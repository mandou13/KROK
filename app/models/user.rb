class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  after_create :create_first_planner

  has_many :recipes
  has_many :planners
  has_many :liked_recipes
  has_many :preferences
  has_many :ingredients, through: :preferences
  has_many :ratings
  has_many :planner_recipes, through: :planners
  has_many :shopping_lists, through: :planners

  has_one_attached :photo


  def create_first_planner
    Planner.create!(user: self, name: "#{Time.now.strftime("%d")}/#{Time.now.strftime("%m")} Menu");
  end
end
