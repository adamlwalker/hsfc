class AnimalsController < ApplicationController
  SHELTER_ID = 'VA163'

  before_filter :find_shelter, only: [:dogs, :cats, :rabbits, :small_animals, :horses]

  def dogs
    select_pets('Dog')
    render 'animals'
  end

  def cats
    select_pets('Cat')
    render 'animals'
  end

  def rabbits
    select_pets('Rabbit')
    render 'animals'
  end

  def small_animals
    select_pets('Small & Furry')
    render 'animals'
  end

  def horses
    select_pets('Horse')
    render 'animals'
  end

  private

  def petfinder_client
    @client ||= Petfinder::Client.new
  end

  def find_shelter
    @pets ||= petfinder_client.shelter_pets(SHELTER_ID, count: 1000)
  end

  def find_pet
    @animal = petfinder_client.pet(params[:petfinder_id])
  end

  def select_pets(pet_type)
    @animals = @pets.select { |pet| pet.animal ==  pet_type }
  end
end
