require 'spec_helper'

describe "contacts/new.html.erb" do
	it "Should have Suchaaver and Joraaver details" do
		@contact = Contact.new
		
		render
		rendered.should include("I'm Suchaaver")
		rendered.should include("I'm Joraaver")
	end

end
