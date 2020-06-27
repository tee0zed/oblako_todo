Rails.application.routes.draw do
  resources :projects, only: [:index, :create, :show] do
    resources :todos, only: [:update, :create]
  end

  root 'projects#index'
end
