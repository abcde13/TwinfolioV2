require 'spec_helper'

describe ContactsController do

	describe "GET 'new'" do
		it "returns http success" do
			get 'new'
			response.should be_success
		end
	end

	describe "POST #create" do
		before(:each) do
			ActionMailer::Base.delivery_method = :test
			ActionMailer::Base.perform_deliveries = true
			ActionMailer::Base.deliveries = []
		end
		after(:each) do
			ActionMailer::Base.deliveries.clear
		end

		subject { post :create, :contact => {:name => "Joraaver", :to => "machspeeds@gmail.com", :from => "test@example.com", :subject => "check", :body => "test"}}
		context "has valid attributes" do
			it "redirects to new page" do
				expect(subject).to redirect_to(:action => :new)
			end
			it "sends an email to us" do
				post :create, :contact => {:name => "Joraaver", :to => "Joraaver", :from => "test@example.com", :subject => "check", :body => "test"}
				ActionMailer::Base.deliveries.first.to.should eq(['joraaverchahal@gmail.com'])
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
