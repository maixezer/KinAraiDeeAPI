require 'rails_helper'

RSpec.describe User, type: :model do
  context 'db' do
    context 'columns' do
      it { should have_db_column(:email).of_type(:string).with_options(null: false) }
      it { should have_db_column(:first_name).of_type(:string).with_options(null: false) }
      it { should have_db_column(:last_name).of_type(:string).with_options(null: false) }
    end

    context 'indexes' do
      it { should have_db_index(:email).unique(true) }
    end
  end

  context 'Attributes' do
    it 'has email' do
      expect(FactoryGirl.build(:user, email: 'example@kad.com')).to have_attributes(email: 'example@kad.com')
    end
  end

  describe 'Validation' do
    context 'of valid parameters' do
      let(:valid_user) { FactoryGirl.create(:user) }

      it 'checks email presence' do
        expect(valid_user).to validate_presence_of(:email)
      end

      it 'checks email uniqueness' do
        expect(valid_user).to validate_uniqueness_of(:email).ignoring_case_sensitivity
      end

      it 'checks validity of email' do
        expect(valid_user).to be_valid
      end

      it 'checks first_name presence' do
        expect(valid_user).to validate_presence_of(:first_name)
      end

      it 'checks last_name presence' do
        expect(valid_user).to validate_presence_of(:last_name)
      end

      context 'has role' do
        subject { valid_user.has_role?(:account_owner) }
        it { is_expected.to be_truthy }
      end
    end

    context 'of invalid parameters' do
      let(:invalid_user) { FactoryGirl.build(:user, email: '') }

      before { invalid_user.save }

      subject { invalid_user.errors }
      it { is_expected.to include :email }

      context 'with presence error message' do
        subject { invalid_user.errors.messages[:email][0] }
        it { is_expected.to eq %q(can't be blank) }
      end
    end
  end
end
