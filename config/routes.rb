Rails.application.routes.draw do
  root "pages#index"
  get "results", to: "pages#results"
end
