Rails.application.routes.draw do
  get 'reviews/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :restaurants do
    collection do
      get 'top'
    end

    member do
      get 'chef'
    end

    resources :reviews, only: [:new, :create]
  end


  namespace :admin do
    resources :restaurants, only: [:index]
  end

  resources :reviews, only: [ :show, :edit, :update, :destroy ]
end
