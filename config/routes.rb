Rails.application.routes.draw do

  resources :like_dislikes
  #devise_for :users
  resources :posts do
  	resources :comments
    member do
      get :like
    end
  end

  root 'posts#index'

  # Routes match in priority from top to bottom
  # devise_for :users, :controllers => {registerations: 'registerations'}

  devise_for :users, controllers: {
        registerations: 'users/registerations'
      }

      delete 'destroy' => 'comments_controller#destroy', defaults: { format: 'js' }


  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
