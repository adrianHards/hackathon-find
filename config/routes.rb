Rails.application.routes.draw do
  root to: "patients#upload"
  get "/confirmation", to: "patients#confirmation", as: :confirmation

  resources :patients, only: [:create, :show, :index]

end
