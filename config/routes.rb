Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :users, only:[:index, :new, :create, :update, :destroy] do 
    resources :food, only:[:index, :new, :create, :destroy]
    resources :recipes, only: [:index, :show, :new, :create, :destroy, :public]
  end

  get 'public_recipes' => 'recipes#public_recipes'
end
