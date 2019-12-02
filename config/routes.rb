Rails.application.routes.draw do
  root to: "pages#home"
  devise_for :users
  devise_scope :user do
    get 'sign_in', to: 'devise/sessions#new'
  end
  resources :users, only: :update do
    member do
      resources :work_logs
    end
  end
  # http://guides.rubyonrails.org/routing.html
end
