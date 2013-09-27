Dummy::Application.routes.draw do
  resources :tasks, only: [:index, :new, :create]

  # for manual testing of elements
  get ':controller/:action'
end
