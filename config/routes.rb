Rails.application.routes.draw do
  root to: "patients#upload"

  resources :patients, only: [:create, :show, :index, :edit, :update, :delete]
  get "/verified", to: "patients#verified", as: :verified
  get "/confirmation", to: "patients#confirmation", as: :confirmation
  post "/cloudinary", to: "patients#cloudinary", as: :cloudinary
end
