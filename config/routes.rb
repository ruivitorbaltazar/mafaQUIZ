Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :quizzes, except: %i[index] do
    resources :questions, only: %i[create update destroy] do
      resources :answers, only: %i[create update destroy]
    end
    resources :teams, except: %i[index]
  end
end
