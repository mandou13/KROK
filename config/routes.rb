Rails.application.routes.draw do
  devise_for :users
  root to: 'recipes#index'

  resources :profiles, only: :show

  resources :recipes
  resources :planners, only: [:show, :create, :update] do
    resources :planner_recipes, only: [:destroy, :create]
  end
  resources :shopping_lists, only: [:index, :update]
  resources :liked_recipes, only: [:index, :create, :destroy]
  resources :ratings, only: :create

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
