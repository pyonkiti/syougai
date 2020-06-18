Rails.application.routes.draw do

    namespace :master do
        # 元請け
        resources :motoukes
        # ユーザーキー
        resources :userkeys
        # エンドユーザー
        resources :endusers
    end
    
    
    # ログイン
    get '/login', to: 'sessions#new'
    post '/login', to: 'sessions#create'
    delete '/logout', to: 'sessions#destroy'

    # ルート
    root to: 'tasks#index'

    # ユーザー登録
    namespace :admin do
        resources :users do
            post :import, on: :collection
        end
    end
    
    # 障害情報
    resources :tasks do
        collection do
            get 'search'
            get 'search_mkn'
            get 'excel'
        end
    end

end
