Rails.application.routes.draw do
  resources :projects, only: [:index, :create, :show] do
    resources :todos, only: :update
  end

  resources :todos, only: :create

  root 'projects#index'
end
