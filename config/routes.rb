Rails.application.routes.draw do
  devise_for :users, only: [:omniauth_callbacks, :sessions], controllers: {omniauth_callbacks: "users/omniauth_callbacks"} 

  root :to => "pages#home"
end
