require 'rails_helper'

RSpec.describe Food, type: :model do
  context 'db' do
    context 'columns' do
      it { should have_db_column(:name).of_type(:string) }
      it { should have_db_column(:tags).of_type(:text) }
      it { should have_db_column(:calories).of_type(:float) }
    end
  end

  context 'Attributes' do
    let(:food) { FactoryGirl.build(:food) }

    it 'has name' do
      expect(food).to have_attributes(name: food.name)
    end

    it 'has tags' do
      expect(food).to have_attributes(tags: food.tags)
    end

    it 'has calories' do
      expect(food).to have_attributes(calories: food.calories)
    end
  end

  describe 'Validation' do
    context 'of valid parameters' do
      let(:valid_food) { FactoryGirl.create(:food) }

      it 'checks name presence' do
        expect(valid_food).to validate_presence_of(:name)
      end

      it 'checks name uniqueness' do
        expect(valid_food).to validate_uniqueness_of(:name)
      end

      it 'checks validity of name' do
        expect(valid_food).to be_valid
      end

      it 'check calories numericality' do
        expect(valid_food).to validate_numericality_of(:calories)
      end
    end

    context 'of invalid parameters' do
      let(:food) { FactoryGirl.build(:food, name: 'food') }
      let(:other_food) { FactoryGirl.build(:food, name: 'food') }
      let(:invalid_food) { FactoryGirl.build(:food, name: '') }

      before do
        food.save
        other_food.save
        invalid_food.save
      end

      subject { other_food.errors }
      it { is_expected.to include :name }

      context 'with uniqueness error message' do
        subject { other_food.errors.messages[:name][0] }
        it { is_expected.to match(/has.*taken/i) }
      end

      subject { invalid_food.errors }
      it { is_expected.to include :name }

      context 'with presence error message' do
        subject { invalid_food.errors.messages[:name][0] }
        it { is_expected.to eq %q(can't be blank) }
      end
    end
  end
end
