require 'rails_helper'

RSpec.describe Post, type: :model do
  describe "validations" do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:likes) }
    it { is_expected.to validate_presence_of(:user) }
    it { is_expected.to validate_presence_of(:message) }
  end

  describe "#like_from(user)" do
    let(:user) { User.create(email: "user@social.com", password: "12345678") }
    let(:other_user) { User.create(email: "other-user@social.com", password: "12345678") }
    let(:post) { Post.create(message: "Whoopie", user: user) }
    let(:like) { Like.create(post: post, user: user) }
    subject { post.like_from(user) }

    before { like }

    it { is_expected.to eq like }

    context "when not liked by the given user" do
      let(:like) { Like.create(post: post, user: other_user) }

      it { is_expected.to be_nil }
    end
  end
end
