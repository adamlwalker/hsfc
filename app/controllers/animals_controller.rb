class AnimalsController < ApplicationController
  SHELTER_ID = 'VA163'

  before_filter :find_shelter, only: [:dogs, :cats, :rabbits, :small_animals, :horses]
  before_filter :find_and_render_pet, only: [:dog, :cat, :rabbit, :small_animal, :horse]

  def dogs
    select_pets('Dog')
    render 'index'
  end

  def dog
  end

  def cats
    select_pets('Cat')
    render 'index'
  end

  def cat
  end

  def rabbits
    select_pets('Rabbit')
    render 'index'
  end

  def rabbit
  end

  def small_animals
    select_pets('Small & Furry')
    render 'index'
  end

  def small_animal
  end

  def horses
    select_pets('Horse')
    render 'index'
  end

  def horse
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

  def find_and_render_pet
    find_pet
    render 'show'
  end

  def select_pets(pet_type)
    @animals = @pets.select { |pet| pet.animal == pet_type }
  end

  def with_error_handling
    yield
  rescue Petfinder::Error
    flash[:alert] = 'Information is currently unavailable, try again later.'
    redirect_to root_url and return
  end
end
