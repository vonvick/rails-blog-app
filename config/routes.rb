Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :roles do
      end
      resources :users, only: [:create, :index, :show, :update, :destroy] do
        collection do
          post 'login'
        end
      end
    end
  end
end
