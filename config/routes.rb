Rails.application.routes.draw do
  root "items#index"
  
  resources :categories

  resources :items do 
    resources :comments, only: [:create]
  end

  namespace :api do
    namespace :v1 do
      resources :items, only:[] do
        member do
          post :favorite
        end
      end
    end
  end
  # cart
  post "/abc/:id

  resource :cart , only: [:index, :edit]
  # 這裡的resource不使用複數(s)，是因為複數的話在網址上可以看到id

  # users
  get "/login", to: "users#login"
  post "/login", to: "users#sign_in"
  delete "/logout", to: "users#logout"
  get "/sign_up", to: "users#sign_up"
  post "/sign_up", to: "users#registration"


end