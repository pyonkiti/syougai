Rails.application.routes.draw do

    # ログイン
    get '/login', to: 'sessions#new'
    post '/login', to: 'sessions#create'
    delete '/logout', to: 'sessions#destroy'

    # ユーザー登録
    namespace :admin do
        resources :users
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
