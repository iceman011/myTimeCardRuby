Rails.application.routes.draw do

    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    resources :task_types do
        collection do
        #get 'task_types/search', to: 'task_types#search'
        get 'search' #, to: 'task_types#search'
      end
    end
    
    #get 'task_types/search', to: 'task_types#search'
    #get 'clm_work_items/search', to: 'clm_work_items#search'
    
    resources :clm_work_items do
        collection do
            get 'search'
        end
    end
    #resources :cards
    resources :emps
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    
    root "welcome#index"
    
    resources :emps do
        resources :cards
    end
  
  
    get 'sign_up', to: 'emps#new'
    post 'sign_up', to: 'emps#create'
    
    get 'sign_in', to: 'sessions#new'
    post 'sign_in', to: 'sessions#create', as: 'log_in'
    delete 'logout', to: 'sessions#destroy'
    
    get 'password', to: 'passwords#edit', as: 'edit_password'
    patch 'password', to: 'passwords#update'
    get 'password/reset', to: 'password_resets#new'
    post 'password/reset', to: 'password_resets#create'
    get 'password/reset/edit', to: 'password_resets#edit'
    patch 'password/reset/edit', to: 'password_resets#update'

end
