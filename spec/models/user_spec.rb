require 'rails_helper'

RSpec.describe User, type: :model do
  subject { build(:user) }

  # describe 'associations' do
  # end

  describe 'validations' do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email).ignoring_case_sensitivity }
    it { should allow_value(Faker::Internet.email).for(:email) }
  end

  describe 'hooks' do
    let(:user) { build(:user, :with_denormalized_email) }

    it 'should normalize email before validation' do
      denormalized_email = user.email
      normalized_email = user.email.downcase.strip
      expect { user.validate }.to change(user, :email).from(denormalized_email).to(normalized_email)
    end
  end
end
