Rails.application.routes.draw do
  root to: "patients#upload"
  
  resources :patients, only: [:create, :show, :index]
  get "/confirmation", to: "patients#confirmation", as: :confirmation

  post "/upload", to: "patients#upload", as: :upload
end
