Rails.application.routes.draw do
  root to: "pages#home"
  devise_for :users
  # http://guides.rubyonrails.org/routing.html
end
