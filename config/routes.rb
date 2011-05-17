Blog::Application.routes.draw do
  resources :customers

  resources :posts do
    collection do
      get "search"
    end
  end

  resources :authors do #nested resources sample
    resources :articles do
      resources :comments
    end
  end

  root :to=>'authors#index'
 
end
