Bugzilla::Application.routes.draw do
  devise_for :users
  root to: 'statics#home'
end
