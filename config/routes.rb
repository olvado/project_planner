Rails.application.routes.draw do

  root to: "projects#index"

  resources :projects do
    put '/ajax_update', to: "projects#ajax_update"
  end

end
