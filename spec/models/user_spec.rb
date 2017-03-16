require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Associations' do
    it { should have_many(:posts) }
  end

  describe 'Validations' do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
  end

  it 'has a valid factory' do
    expect(FactoryGirl.create(:user)).to be_valid
  end

  describe '#name' do
    let(:user) { create(:user, first_name: 'Jane', last_name: 'Doe') }
    context 'user has first_name Jane and last_name Doe' do
      it 'returns Jane Doe as the user\'s name' do
        expect(user.name).to eq('Jane Doe')
      end
    end
  end

  describe '#initials' do
    let(:user) { create(:user, first_name: 'John', last_name: 'Doe') }
    context 'user has first_name John and last_name Doe' do
      it 'returns JD as the user\'s initials' do
        expect(user.initials).to eq('JD')
      end
    end
  end
end
