require 'rails_helper'

RSpec.describe 'create post spec', type: :feature, js: true do

  context 'when user is logged in' do
    let(:user) { create(:user) }
    before { login_as(user, scope: :user) }
    before { visit new_post_path }

    it 'can view the new post page' do
      expect(page).to have_current_path('/posts/new')
    end

    it 'can create a new post for the user' do
      fill_in 'post_title', with: 'post title'
      fill_in 'post_body', with: 'post body'
      click_button 'Save'

      page.should have_content('post title') # Wait for page to be redirected via Turbolinks JS

      new_post = Post.last
      expect(page).to have_current_path("/posts/#{new_post.id}")
      expect(new_post.author_id).to eq(user.id)
    end
  end

  context 'when user is not logged in' do
    it 'redirects to login page and has require login message' do
      visit new_post_path

      expect(page).to have_current_path('/users/sign_in')
      expect(page).to have_content('You need to sign in or sign up before continuing.', wait: 3)
    end
  end
end
