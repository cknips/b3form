Dummy::Application.routes.draw do
  resources :tasks, only: [:index, :new, :create]

  resources :test_models
end
