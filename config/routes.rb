Rails.application.routes.draw do
  mount Avo::Engine, at: Avo.configuration.root_path
  root 'welcome#index'

  devise_for :users, skip: [:registrations], controllers: {
    session: 'users/session',
    password: 'users/password',
    invitation: 'users/invitation'
  }, path: '/', path_names: { sign_in: 'login', sign_out: 'logout' }

end
