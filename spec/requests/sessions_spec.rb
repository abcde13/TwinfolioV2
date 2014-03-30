require 'spec_helper'

describe 'Session integration' do
		
	let(:params) do {:username => "joraaver", :password => "test"}
	end
	before {User.create(:username => "joraaver", :password => "test")}	
	context "logged in" do
		it "current_user should return true" do
			post '/posts', :post => {:author => "Joraaver", :title => "Day 1", :text => "testing"}
			post_via_redirect sessions_path, params
			response.body.should include("Edit")
		end
	end


	
				

end
