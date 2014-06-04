Bugzilla::Application.routes.draw do
  devise_for :users, controllers: { confirmations: 'confirmations', passwords: 'passwords', registrations: 'registrations'  }
  get 'statics/home' => 'statics#home', as: :home
  root to: 'statics#home'
  resources :projects do
    resources :members, :stories
  end
  resources :stories do
    resources :tasks, :comments
  end
  get 'projects' => 'projects#index', as: :dashboard
end
