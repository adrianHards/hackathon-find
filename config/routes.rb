Rails.application.routes.draw do
  root to: "patients#upload"
  
  resources :patients, only: [:create, :show, :index]
  get "/confirmation", to: "patients#confirmation", as: :confirmation

  post "/send_cloudinary", to: "patients#send_cloudinary", as: :send_cloudinary
end
