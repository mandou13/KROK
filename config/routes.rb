Rails.application.routes.draw do
  devise_for :users

  root to: 'recipes#index'

  resource :profile, only: :show # attendre la reconfiguration du devise

  resources :recipes do
    resources :liked_recipes, only: :create
  end

  resources :planner_recipes do
    resources :ratings, only: :create
  end

  resources :planners, only: [:show, :create, :update] do
    resources :planner_recipes, only: [:destroy, :create, :update]
    resources :shopping_lists, only: [:index, :update]
  end
  resources :liked_recipes, only: [:index, :destroy]
end
