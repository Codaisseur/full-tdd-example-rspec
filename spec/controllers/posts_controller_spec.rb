require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  let(:user) { User.create(email: "poster@social.com", password: "12345678") }

  let(:valid_attributes) do
    {
      message: "I'm writing tests now!",
      user: user
    }
  end

  let(:invalid_attributes) do
    {
      message: ""
    }
  end

  let!(:a_post) { Post.create! valid_attributes }

  describe "GET #index" do
    it "is not accessible when not logged in" do
      get :index
      expect(response).to redirect_to new_user_session_path
    end

    context "when logged in" do
      login_user

      it "assigns all posts as @posts" do
        get :index
        expect(assigns(:posts)).to eq([a_post])
      end
    end
  end

  describe "GET #show" do
    it "is not accessible when not logged in" do
      get :show, {id: a_post.to_param}
      expect(response).to redirect_to new_user_session_path
    end

    context "when logged in" do
      login_user

      it "assigns the requested post as @post" do
        get :show, {id: a_post.to_param}
        expect(assigns(:post)).to eq(a_post)
      end
    end
  end

  describe "POST #create" do
    it "is not accessible when not logged in" do
      post :create, {post: valid_attributes}
      expect(response).to redirect_to new_user_session_path
    end

    context "when logged in" do
      login_user

      context "with valid params" do
        it "creates a new Post" do
          expect {
            post :create, {post: valid_attributes}
          }.to change(Post, :count).by(1)
        end

        it "assigns a newly created post as @post" do
          post :create, {post: valid_attributes}
          expect(assigns(:post)).to be_a(Post)
          expect(assigns(:post)).to be_persisted
        end

        it "assigns the logged in user as the post's author" do
          post :create, {post: valid_attributes}
          expect(assigns(:post).user).to eq user
        end

        it "redirects to the created post" do
          post :create, {post: valid_attributes}
          expect(response).to redirect_to(root_url)
        end
      end

      context "with invalid params" do
        it "assigns a newly created but unsaved post as @post" do
          post :create, {post: invalid_attributes}
          expect(assigns(:post)).to be_a_new(Post)
        end

        it "re-renders the 'new' template" do
          post :create, {post: invalid_attributes}
          expect(response).to render_template("new")
        end
      end
    end
  end
end
