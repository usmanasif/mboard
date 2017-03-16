require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  let(:valid_attributes) { { body: 'Lorem ipsum' } }
  let(:invalid_attributes) { { body: '' } }
  let(:user) { create(:user) }
  let(:my_post) { create(:post, author_id: user.id) }

  login_user

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Comment' do
        expect {
          post :create, { post_id: my_post.id, comment: valid_attributes }
        }.to change(Comment, :count).by(1)
      end

      it 'assigns a newly created comment as @comment' do
        post :create, { post_id: my_post.id, comment: valid_attributes }
        expect(assigns(:comment)).to be_a(Comment)
        expect(assigns(:comment)).to be_persisted
      end

      it 'redirects to the my_post with created comment' do
        post :create, { post_id: my_post.id, comment: valid_attributes }
        expect(response).to redirect_to(my_post)
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved comment as @comment' do
        post :create, { post_id: my_post.id, comment: invalid_attributes }
        expect(assigns(:comment)).to be_a_new(Comment)
      end

      it 'redirects to the my_post with failed comment' do
        post :create, { post_id: my_post.id, comment: invalid_attributes }
        expect(response).to redirect_to(my_post)
      end
    end
  end
end
