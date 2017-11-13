Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, :controllers => {registerations: 'registerations'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :posts do
  	resources :comments
  end
  root 'posts#index'
end
