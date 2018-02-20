Rails.application.routes.draw do
  devise_for :users, only: :omniauth_callbacks
  root :to => "pages#home"
end
