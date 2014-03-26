require 'spec_helper'

describe "PostsController" do
	describe "GET index" do
		it "recieves 200 OK" do
			get :index
			expect(response.status).to eq(200)
		end
	end
end
