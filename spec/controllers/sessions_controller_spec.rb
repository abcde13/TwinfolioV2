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
			let(:params) do {:username => "joraaver", :password => "test"}
			end
			before {User.create(:username => "joraaver", :password => "test")}	
			it "redirects to /posts/index"  do
				post :create, params
				response.should redirect_to(posts_path)
			end
	
		end
		context "bad attempt" do
			let(:params) do {:username => "jor", :password => "test"}
			end
			before {User.create(:username => "s", :password => "test")}	
			it "renders login"  do
				post :create, params
				response.should render_template(:new)
				
			end
		end
	end

	describe "DESTROY session" do
		before {User.create(:username => "j", :password => "test")}
		it "redirects to home page" do
			post :create, :username => "j", :password => "test"
			post :destroy, :id => User.authenticate('j','test').id
			response.should redirect_to(posts_path)
		end
	end

end
