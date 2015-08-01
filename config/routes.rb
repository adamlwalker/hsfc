Rails.application.routes.draw do
  root 'home#index'
  resources :events

  get '/adopt/dogs' => 'animals#dogs', as: :dogs_index
  get '/adopt/cats' => 'animals#cats', as: :cats_index
  get '/adopt/rabbits' => 'animals#rabbits', as: :rabbits_index
  get '/adopt/small_animals' => 'animals#small_animals', as: :small_animals_index
  get '/adopt/horses' => 'animals#horses', as: :horses_index

  cms_fortress_routes :path => '/cms-admin'

  comfy_route :blog_admin, :path => '/admin'
  comfy_route :blog, :path => '/blog'

  comfy_route :cms_admin, :path => '/admin'

  # Make sure this routeset is defined last
  comfy_route :cms, :path => '/', :sitemap => false

end
