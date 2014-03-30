require 'spec_helper'

describe SessionsController do

	describe "GET 'new'" do
		it "returns http success" do
			get 'new'
			response.should be_success
		end
	end
	describe "checking login attempts" do
		context "good attempt" do
			let(:params) do {:username => "j", :password => "test"}
			end
			before {User.create(:username => "j", :password => "test")}	
			it "redirects to /posts/index"  do
				post :create, params
				response.should redirect_to(posts_path)
			end
		end
		context "bad attempt" do
			it "renders login"  do
				user = User.create(:username => "s", :password => 'test')
				User.last.should eq(user)
				post :create, :user =>  {:username => "j", :password => "test"}
				response.should render_template(:new)
			end
		end
	end

	describe "DESTROY session" do
		it "redirects to home page" do
			get 

end
