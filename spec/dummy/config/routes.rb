Rails.application.routes.draw do
  resources :articles

  mount UswdsComponents::Engine => '/uswds_components'
end
