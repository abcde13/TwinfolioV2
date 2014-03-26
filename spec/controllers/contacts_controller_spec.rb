require 'spec_helper'

describe ContactsController do

	describe "GET 'new'" do
		it "returns http success" do
			get 'new'
			response.should be_success
		end
	end

	describe "CREATE new" do
		pending("First work on contact create. then work on email send!")
		#before(@contact = Contact.create!(:to
		it "should send email" do
		end
	end

		

end
