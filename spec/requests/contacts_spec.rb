require 'spec_helper'

describe "Contacts" do
	
	
	describe "testing creation of contact" do
		context "with valid attr" do
			it "should say success" do
				post_via_redirect contacts_path, :contact => {:name  => 'J', :to => 'test@gmail.com', :from => 't@gmail.com', :subject => 'test', :body => 'test'}
				response.body.should include("An email has been sent. Thanks for dropping by!")
			end
		end
		context "with invalid attr" do
			it "should say failure" do
				post_via_redirect contacts_path, :contact => {:name => nil, :to => nil, :from => nil, :subject => nil, :body => nil}	
				response.body.should include("You need to fill out a little more information.")
			end
		end
	end
end
