Rails.application.routes.draw do

    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    resources :task_types do
        collection do
        #get 'task_types/search', to: 'task_types#search'
        get 'search' #, to: 'task_types#search'
      end
    end
    
    
    get 'clm_work_items/search', to: 'clm_work_items#search'

    resources :clm_work_items
    resources :cards
    resources :emps
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    
    #root "emps#index"
    root "emps#index"
    
    resources :emps do
        resources :cards
    end
  

end
