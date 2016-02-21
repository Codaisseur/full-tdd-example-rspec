require 'rails_helper'

RSpec.describe Like, type: :model do
  describe "validations" do
    it { is_expected.to belong_to(:post) }
    it { is_expected.to belong_to(:user) }

    describe "Make sure users can't like the same post more than once" do
      let(:user) { User.create(email: 'foo@bar.com', password: '12345678' ) }
      let(:post) { Post.create(message: 'Hello, World!') }
      subject { Like.new(post: post, user: user) }
      it { is_expected.to validate_uniqueness_of(:post_id).scoped_to(:user_id) }
    end
  end
end
