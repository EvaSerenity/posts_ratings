Rails.application.routes.draw do

  resources :posts, only: [:create] do
    resources :ratings, only: [:create]

    collection do
      get 'best'
    end
  end

end
