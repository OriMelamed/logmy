Rails.application.routes.draw do
  devise_for :users, skip: [:registrations], controllers: {
    session: 'users/session',
    password: 'users/password',
    invitation: 'users/invitation'
  }, path: '/', path_names: { sign_in: 'login', sign_out: 'logout' }
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
