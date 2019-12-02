Rails.application.routes.draw do
  root to: "pages#home"
  devise_for :users
  devise_scope :user do
    get 'sign_in', to: 'devise/sessions#new'
  end
  resources :users do
    resources :work_logs
  end
  # http://guides.rubyonrails.org/routing.html
end
