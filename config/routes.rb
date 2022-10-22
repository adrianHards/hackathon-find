Rails.application.routes.draw do
  root to: "patients#upload"

  resources :patients, only: [:create, :show, :index]
  get "/confirmation", to: "patients#confirmation", as: :confirmation

  post "/cloudinary", to: "patients#cloudinary", as: :cloudinary
end
