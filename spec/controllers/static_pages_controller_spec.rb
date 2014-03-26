require 'spec_helper'

describe StaticPagesController do
	render_views
	
	describe "GET other" do
		it "recieves 200 OK" do
			get :other
			expect(response.status).to eq(200)
		end	
	end

end
