require 'rails_helper'

RSpec.describe LikesController, type: :routing do
  describe "routing" do
    it "routes to #create" do
      expect(:post => "/posts/2/likes").to route_to("likes#create", post_id: "2")
    end

    it "routes to #destroy" do
      expect(:delete => "/posts/4/likes/1").to route_to("likes#destroy", post_id: "4", id: "1")
    end
  end
end

