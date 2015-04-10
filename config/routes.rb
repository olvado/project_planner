Rails.application.routes.draw do

  root to: "projects#index"
  
  devise_for :users, 
    :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  resources :projects do
    put '/ajax_update', to: "projects#ajax_update"
  end

end
