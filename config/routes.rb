Rails.application.routes.draw do
  root to: 'homes#top'
  resources :tasks, except: [:show, :new] do
    member do
      patch :good
    end
  end
  get '/time' => 'tasks#time'
  get '/every' => 'tasks#every'
  get '/todo' => 'tasks#todo'
  get '/by_chance' => 'tasks#by_chance'
  # delete '/destroy_all' => 'tasks#destroy_all'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
