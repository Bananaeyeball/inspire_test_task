Rails.application.routes.draw do
  root to: 'home#index'
  resources :questions, only: [:index]
  resources :exam_questions
  resources :preparation_questions
  resources :exams
  resources :preparation_tests
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
