class HomeController < ApplicationController

  SHELTER_ID = 'VA163'

  before_filter :find_shelter, only: [:dogs, :cats, :rabbits, :small_animals, :horses]

  def index
    @images = Comfy::Cms::File.where(file_content_type: "image/jpeg")
    @articles = Comfy::Cms::Page.where('label ~* ?', 'news').last(3).reverse
    @dogs = select_pets('Dog')
    @cats = select_pets('Cat')
    @horses = select_pets('Horse')
    @rabbits = select_pets('Rabbit')

    render cms_layout: 'base', cms_blocks: {
      carousel: { template: '/home/index' },
      news: { partial: '/home/news' }
    }
  end

  private

  def petfinder_client
    @client ||= Petfinder::Client.new
  end

  def find_shelter
    with_error_handling do
      @pets ||= petfinder_client.shelter_pets(SHELTER_ID, count: 1000)
    end
  end

  def find_pet
    with_error_handling do
      @animal = petfinder_client.pet(params[:petfinder_id])
    end
  end

  def select_pets(pet_type)
    with_error_handling do
      @pets ||= petfinder_client.shelter_pets(SHELTER_ID, count: 1000)
    end
    @animals = @pets.select { |pet| pet.animal == pet_type }
  end

  def with_error_handling
    yield
  rescue Petfinder::Error
    flash[:alert] = 'Information is currently unavailable, try again later.'
    redirect_to root_url and return
  end
end
