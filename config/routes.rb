Rails.application.routes.draw do
  get 'home/index'
  resources :books

  post "books"=>"books#create"

  #.../todolists/1や.../todolists/3に該当する
  root to: "home#index"

end
