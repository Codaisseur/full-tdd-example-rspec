require 'rails_helper'

RSpec.describe LikesController, type: :controller do
  let(:user) { User.create(email: "poster@social.com", password: "12345678") }

  let!(:a_post) do
    Post.create!(
      message: "I'm writing tests now!",
      user: user
    )
  end

  let(:valid_attributes) do
    { post_id: a_post.to_param }
  end

  describe "POST #create" do
    it "is not accessible when not logged in" do
      post :create, { post_id: a_post.to_param }
      expect(response).to redirect_to new_user_session_path
    end

    context "when logged in" do
      login_user

      it "creates a new Like" do
        expect {
          post :create, { post_id: a_post.to_param }
        }.to change(Like, :count).by(1)
      end

      it "assigns a newly created Like as @like" do
        post :create, { post_id: a_post.to_param }
        expect(assigns(:like)).to be_a(Like)
        expect(assigns(:like)).to be_persisted
      end

      it "assigns the logged in user as the like's owner" do
        post :create, { post_id: a_post.to_param }
        expect(assigns(:like).user).to eq user
      end

      it "redirects to the liked post" do
        post :create, { post_id: a_post.to_param }
        expect(response).to redirect_to(a_post)
      end
    end
  end

  describe "DELETE #destroy" do
    let!(:like) { Like.create! post: a_post, user: user }

    it "is not accessible when not logged in" do
      delete :destroy, { post_id: a_post.to_param, id: like.to_param }
      expect(response).to redirect_to new_user_session_path
    end

    context "when logged in" do
      login_user

      it "destroys an existing Like" do
        expect {
          delete :destroy, { post_id: a_post.to_param, id: like.to_param }
        }.to change(Like, :count).by(-1)
      end
    end
  end
end
