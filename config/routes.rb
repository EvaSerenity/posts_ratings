Rails.application.routes.draw do

  resources :posts, only: [:create] do
    resources :ratings, only: [:create]

    collection do
      get 'best'
    end
  end

  get 'statistics/users_with_same_ips', to: 'statistics#same_ips'

end
