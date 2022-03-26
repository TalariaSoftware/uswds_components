Rails.application.routes.draw do
  mount UswdsComponents::Engine => '/uswds_components'
  get '/', to: redirect('/rails/view_components')
end
