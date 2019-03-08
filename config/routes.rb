Rails.application.routes.draw do
  root to: 'home#index'
  resources :questions, only: :index
  resources :exam_questions, except: :index
  resources :preparation_questions, except: :index
  resources :exams, except: :index
  resources :preparation_tests, except: :index
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
