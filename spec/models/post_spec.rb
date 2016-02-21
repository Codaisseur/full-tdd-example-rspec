require 'rails_helper'

RSpec.describe Post, type: :model do
  describe "validations" do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:likes) }
    it { is_expected.to validate_presence_of(:user) }
    it { is_expected.to validate_presence_of(:message) }
  end
end
