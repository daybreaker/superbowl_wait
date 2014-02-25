Superbowl::Application.routes.draw do
  resources :ratings


  resources :bathrooms


  devise_for :users

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
 
#  match 'observation' => 'destination#update'
#  match 'observation/:unique_id' => 'destination#observation'
#  get 'destination/:unique_id' => 'destination#show'
#  get 'destination' => 'destination#update'

#  match 'get_image' => 'destination#get_image'
  

  root :to => 'bathrooms#index'
end
