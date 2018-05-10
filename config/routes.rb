Soshi::Engine.routes.draw do
  root to: "posts#index"

  resources :posts, except: [:show]
  resources :tags, only: [:index, :show]

  resources :categories, param: :slug, only: [:index, :new, :create]
  resources :categories, param: :slug, path: '/', except: [:index, :new, :create] do
    resources :posts, path: '/', only: [:show]
  end


end
