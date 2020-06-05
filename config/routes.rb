Rails.application.routes.draw do

    # 元請け
    resources :motoukes
    

    # ログイン
    get '/login', to: 'sessions#new'
    post '/login', to: 'sessions#create'
    delete '/logout', to: 'sessions#destroy'

    # ユーザー登録
    namespace :admin do
        resources :users do
            post :import, on: :collection
        end
    end

    # 障害情報
    root to: 'tasks#index'
    resources :tasks do
        collection do
            get 'search'
            get 'search_mkn'
        end
    end

end
