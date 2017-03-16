require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'Associations' do
    it { should belong_to(:author) }
    it { should belong_to(:post) }
  end

  describe 'Validations' do
    it { should validate_presence_of(:body) }
    it { should validate_presence_of(:author_id) }
    it { should validate_presence_of(:post_id) }
  end

  it 'has a valid factory' do
    user = FactoryGirl.create(:user)
    post = FactoryGirl.create(:post, author: user)

    expect(FactoryGirl.create(:comment, author: user, post: post)).to be_valid
  end
end
