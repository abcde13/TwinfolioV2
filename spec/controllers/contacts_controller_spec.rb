require 'spec_helper'

describe ContactsController do

	describe "GET 'new'" do
		it "returns http success" do
			get 'new'
			response.should be_success
		end
	end

	describe "POST #create" do
		subject { post :create, :contact => {:name => "Joraaver", :to => "s", :from => "j", :subject => "check", :body => "test"}}
		context "has valid attributes" do
			it "redirects to new page" do
				expect(subject).to redirect_to(:action => :new)
			end
		end
		
		context "has bad attributes" do
			it "renders same page with errors" do
				post :create, :contact => {:name => nil, :to => nil, :from => nil, :subject => nil, :body => nil}	
				response.should render_template(:new)
			end
		end
				
	end

		

end
