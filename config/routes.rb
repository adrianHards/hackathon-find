Rails.application.routes.draw do
  root to: "patients#upload"

  resources :patients, only: [:home, :show, :index]
  get "/confirmation", to: "patients#confirmation", as: :confirmation

end
