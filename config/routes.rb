# Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  devise_for :users

  # Defines the root path route ("/")
  root "pages#home"

  get 'about-me', to: 'pages#about'
  get 'contact', to: 'pages#contact' #to - to customize route

  resources :blogs do
    member do
      get :toggle_status
    end
  end

  resources :projects, except: [:show]
  get 'project/:id', to: 'projects#show', as: 'project_show' #as - to customize the _path
end
