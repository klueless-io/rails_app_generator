Rails.application.routes.draw do
  resources :todo_items do
    member do
      get :insert_at
      get :move_lower
      get :move_higher
      get :move_to_bottom
      get :move_to_top
      get :remove_from_list
    end
  end
  resources :todo_lists
  root 'home#index'
  get 'home/index'
end
