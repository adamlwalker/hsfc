Rails.application.routes.draw do
  root 'home#index'
  # FIXME there are some excessive routes

  get '/adopt/dogs' => 'animals#dogs', as: :dogs_index
  get '/adopt/dogs/:petfinder_id' => 'animals#dog', as: :dog
  get '/adopt/birds' => 'animals#birds', as: :birds_index
  get '/adopt/birds/:petfinder_id' => 'animals#bird', as: :bird
  get '/adopt/cats' => 'animals#cats', as: :cats_index
  get '/adopt/cats/:petfinder_id' => 'animals#cat', as: :cat
  get '/adopt/rabbits' => 'animals#rabbits', as: :rabbits_index
  get '/adopt/rabbits/:petfinder_id' => 'animals#rabbit', as: :rabbit
  get '/adopt/small_animals' => 'animals#small_animals', as: :small_animals_index
  get '/adopt/small_animals/:petfinder_id' => 'animals#small_animal', as: :small_animal
  get '/adopt/horses' => 'animals#horses', as: :horses_index
  get '/adopt/horses/:petfinder_id' => 'animals#horse', as: :horse

  resources :news, only: :index

  #adoption_form_id = SubmissionTemplate.where(id: @submission_template_id)
  get "/adoption_form", #?submission_template_id=#{adoption_form_id}",
      to: "public#new",
      as: 'adoption_form'
  post '/adoption_form',
       to: 'public#create',
       as: 'adoption_submission'

  get  '/thanks',
       to: 'public#submission_thank_you',
       as: 'submission_thank_you'
  post '/thanks',
       to: 'public#submission_thank_you',
       as: ''


  resources :submission_templates, only: [ :index, :update ]
  put '/submission_templates',
      to: 'submission_templates#update',
      as: 'new_submission_template'

  resources :submission_template_questions, only: [ :index, :update ]
  put '/submission_template_questions',
      to: 'submission_template_questions#update',
      as: 'new_submission_template_question'

  resources :questions, only: [ :index, :update, :destroy ]
  put '/questions',
      to: 'questions#update',
      as: 'update_question'
  put '/questions',
      to: 'questions#delete',
      as: 'delete_question'




  cms_fortress_routes :path => '/cms-admin'

  comfy_route :blog_admin, :path => '/admin'
  comfy_route :blog, :path => '/blog'

  comfy_route :cms_admin, :path => '/admin'

  # Make sure this routeset is defined last
  comfy_route :cms, :path => '/', :sitemap => false

end
