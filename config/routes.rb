Rails.application.routes.draw do

  resources :posts do
  	resources :comments
  end

  root 'posts#index'

  # Routes match in priority from top to bottom
  devise_for :users, :controllers => {registerations: 'registerations'}

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
