require 'rails_helper'

RSpec.describe History, type: :model do
  context 'db' do
    context 'columns' do
      it { should have_db_column(:user_id).of_type(:integer) }
      it { should have_db_column(:food_id).of_type(:integer) }
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
      let(:user) { FactoryGirl.create(:user) }
      let(:food) { FactoryGirl.create(:food) }
      let(:valid_history) { FactoryGirl.create(:history, user: user, food: food) }

      it 'checks user presence' do
        expect(valid_history).to validate_presence_of(:user)
      end

      it 'checks food presence' do
        expect(valid_history).to validate_presence_of(:food)
      end

      it 'checks validity of history' do
        expect(valid_history).to be_valid
      end
    end

    context 'of invalid parameters' do
      let(:invalid_history) { FactoryGirl.build(:history) }

      before { invalid_history.save }

      subject { invalid_history.errors }
      it { is_expected.to include :user, :food }

      context 'with presence error message' do
        subject { invalid_history.errors.messages[:user][0] }
        it { is_expected.to eq %q(can't be blank) }

        subject { invalid_history.errors.messages[:food][0] }
        it { is_expected.to eq %q(can't be blank) }
      end
    end
  end
end
