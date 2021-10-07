Rails.application.routes.draw do
  root to: 'homes#top'
  resources :tasks, except: [:show, :new]
  get '/time' => 'tasks#time'
  get '/every' => 'tasks#every'
  get '/todo' => 'tasks#todo'
  get '/by_chance' => 'tasks#by_chance'
  get '/good' => 'tasks#good'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
