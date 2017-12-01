Rails.application.routes.draw do

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :links, only: [:index, :create, :new, :show, :edit]
  root "links#index"
  get 'links/check/:token' => "links#check_token"
  get '/:token' => 'links#redirect'
end
