require 'rails_helper'

describe AnimalHelper do
  describe '#gender_label' do
    it 'returns Male for M' do
      expect(helper.gender_label('M')).to eq('Male')
    end

    it 'returns Female for F' do
      expect(helper.gender_label('F')).to eq('Female')
    end

    it 'returns Unknown for anything else' do
      expect(helper.gender_label(nil)).to eq('Unknown')
    end
  end

  describe '#size_label' do
    it 'returns Small for S' do
      expect(helper.size_label('S')).to eq('Small')
    end

    it 'returns Medium for M' do
      expect(helper.size_label('M')).to eq('Medium')
    end

    it 'returns Large for L' do
      expect(helper.size_label('L')).to eq('Large')
    end

    it 'returns Extra-large for XL' do
      expect(helper.size_label('XL')).to eq('Extra-large')
    end

    it 'returns Unknown for anything else' do
      expect(helper.size_label(nil)).to eq('Unknown')
    end
  end

  describe '#options_label' do
    it 'returns the options in a human readable form' do
      expect(helper.options_label(['hasShots', 'altered'])).to eq('Has shots, Altered')
    end

    it 'returns Unknown if there are no options' do
      expect(helper.options_label(nil)).to eq('Unknown')
    end
  end
end
