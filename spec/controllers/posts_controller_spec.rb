require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  let(:user) { create(:user) }
  let(:valid_attributes) { attributes_for(:post, author_id: user.id) }
  let(:invalid_attributes) { { title: '', body: '' , author_id: nil } }

  describe 'GET #index' do
    it 'assigns all posts as @posts' do
      post = Post.create! valid_attributes
      get :index, {}
      expect(assigns(:posts)).to eq([post])
    end
  end

  describe 'GET #show' do
    it 'assigns the requested post as @post, posts.comments as @comments and a new comment as @comment' do
      post = Post.create! valid_attributes
      get :show, { id: post.to_param }

      expect(assigns(:post)).to eq(post)
      expect(assigns(:comments)).to eq(post.comments)
      expect(assigns(:comment)).to be_a_new(Comment)
    end
  end

  describe 'GET #new' do
    login_user

    it 'assigns a new post as @post' do
      get :new, { }
      expect(assigns(:post)).to be_a_new(Post)
    end
  end

  describe 'POST #create' do
    login_user

    context 'with valid params' do
      it 'creates a new Post' do
        expect {
          post :create, { post: valid_attributes }
         }.to change(Post, :count).by(1)
      end

      it 'assigns a newly created post as @post' do
        post :create, { post: valid_attributes }
        expect(assigns(:post)).to be_a(Post)
        expect(assigns(:post)).to be_persisted
      end

      it 'redirects to the created post' do
        post :create, { post: valid_attributes }
        expect(response).to redirect_to(Post.last)
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved post as @post' do
        post :create, { post: invalid_attributes }
        expect(assigns(:post)).to be_a_new(Post)
      end

      it 're-renders the "new" template' do
        post :create, { post: invalid_attributes }
        expect(response).to render_template('new')
      end
    end
  end
end
