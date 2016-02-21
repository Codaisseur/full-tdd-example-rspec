require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    it { is_expected.to have_many(:posts) }
    it { is_expected.to have_many(:likes) }
  end

  describe "#liked?" do
    let(:user) { User.create(email: "user@social.com", password: "12345678") }
    let(:post) { Post.create(message: "Whoopie", user: user) }
    subject { user.liked?(post) }

    it { is_expected.to be false }

    context "when liked" do
      before { Like.create(post: post, user: user) }
      it { is_expected.to be true }
    end
  end
end
