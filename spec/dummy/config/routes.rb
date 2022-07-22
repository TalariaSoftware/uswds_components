Rails.application.routes.draw do
  mount UswdsComponents::Engine => '/uswds_components'
  mount Lookbook::Engine, at: '/lookbook'

  get '/', to: redirect('/lookbook')
end
