Rails.application.routes.draw do
 get 'microposts/_micropost'
 root             'static_pages#home'
  get 'help'    => 'static_pages#help'
  get 'about'   => 'static_pages#about'
  get 'contact' => 'static_pages#contact'
  get 'signup'  => 'users#new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  resources :users do
  resources :relationships, only: [:index]
  resources :lessons, only: [:create, :show, :destroy, :update] do
    resources :answers
  end
  resources :questions
  end
  resources :relationships, only: [:create, :destroy]
  resources :words
  resources :microposts,          only: [:create, :destroy]
  resources :courses, only: :index do
    resources :lessons
  end
 
  resources :lessons
end
