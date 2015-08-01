require 'rails_helper'

describe AnimalsController, type: :controller do
  let(:dog) { double(:dog, animal: 'Dog') }
  let(:cat) { double(:cat, animal: 'Cat') }
  let(:rabbit) { double(:rabbit, animal: 'Rabbit') }
  let(:small_animal) { double(:small_animal, animal: 'Small & Furry') }
  let(:horse) { double(:horse, animal: 'Horse') }
  let(:client) { double(:client, shelter_pets: [dog, cat, rabbit, small_animal, horse], pet: dog) }

  before do
    allow(Petfinder::Client).to receive(:new).and_return(client)
  end

  describe '#dogs' do
    it 'finds the shelter pets' do
      expect(client).to receive(:shelter_pets).with('VA163', count: 1000)
      get :dogs
    end

    it 'selects only the dogs from the list of pets' do
      get :dogs
      expect(assigns(:animals)).to eq([dog])
    end
  end

  describe '#dog' do
    it 'finds the pet' do
      get :dog, petfinder_id: '1234'
      expect(assigns(:animal)).to eq(dog)
    end
  end

  describe '#cats' do
    it 'finds the shelter pets' do
      expect(client).to receive(:shelter_pets).with('VA163', count: 1000)
      get :cats
    end

    it 'selects only the cats from the list of pets' do
      get :cats
      expect(assigns(:animals)).to eq([cat])
    end
  end

  describe '#cat' do
    it 'finds the pet' do
      allow(client).to receive(:pet).and_return(cat)
      get :cat, petfinder_id: '1234'
      expect(assigns(:animal)).to eq(cat)
    end
  end

  describe '#rabbits' do
    it 'finds the shelter pets' do
      expect(client).to receive(:shelter_pets).with('VA163', count: 1000)
      get :rabbits
    end

    it 'selects only the rabbits from the list of pets' do
      get :rabbits
      expect(assigns(:animals)).to eq([rabbit])
    end
  end

  describe '#rabbit' do
    it 'finds the pet' do
      allow(client).to receive(:pet).and_return(rabbit)
      get :rabbit, petfinder_id: '1234'
      expect(assigns(:animal)).to eq(rabbit)
    end
  end

  describe '#small_animals' do
    it 'finds the shelter pets' do
      expect(client).to receive(:shelter_pets).with('VA163', count: 1000)
      get :small_animals
    end

    it 'selects only the small_animals from the list of pets' do
      get :small_animals
      expect(assigns(:animals)).to eq([small_animal])
    end
  end

  describe '#small_animal' do
    it 'finds the pet' do
      allow(client).to receive(:pet).and_return(small_animal)
      get :small_animal, petfinder_id: '1234'
      expect(assigns(:animal)).to eq(small_animal)
    end
  end

  describe '#horses' do
    it 'finds the shelter pets' do
      expect(client).to receive(:shelter_pets).with('VA163', count: 1000)
      get :horses
    end

    it 'selects only the horses from the list of pets' do
      get :horses
      expect(assigns(:animals)).to eq([horse])
    end
  end

  describe '#horse' do
    it 'finds the pet' do
      allow(client).to receive(:pet).and_return(horse)
      get :horse, petfinder_id: '1234'
      expect(assigns(:animal)).to eq(horse)
    end
  end
end
