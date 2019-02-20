Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  resources :posts do
    resources :comments
  end
  root to: "posts#index"

  post "/like/:id", to: "posts#like", as: "like"
  patch "/dislike/:id", to: "posts#dislike", as: "dislike"

  get "/post_form", to: "users#post_form", as: "post_form"
end
