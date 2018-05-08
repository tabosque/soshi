Soshi::Engine.routes.draw do
  root to: "posts#index"
  resources :categories, except: [:show]
  resources :posts, except: [:show]
  resources :tags, only: [:index, :show]
  resources :categories, param: :slug, path: '/', only: [:show] do
    resources :posts, path: '/', only: [:show]
  end
end
