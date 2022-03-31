Rails.application.routes.draw do
  namespace :v1 do
    resources :comments, only: :show
  end

  namespace :v2 do
    resources :comments, only: :show
  end
end
