require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'Associations' do
    it { should belong_to(:author) }
  end

  describe 'Validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:body) }
    it { should validate_presence_of(:author_id) }
  end

  it 'has a valid factory' do
    user = FactoryGirl.create(:user)
    expect(FactoryGirl.create(:post, author_id: user.id)).to be_valid
  end
end
