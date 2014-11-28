Rails.application.routes.draw do
  root to: "vacancies#index"

  resources :vacancies
  resources :employees
end
