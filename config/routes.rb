Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :articles do
    resources :reviews
  end

  root 'articles#index'

  resources :categories

  resources :articles do
    member do
      put "like" => "articles#upvote"
      put "unlike" => "articles#downvote"

    end
  end

end
