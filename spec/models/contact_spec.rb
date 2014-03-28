require 'spec_helper'

describe Contact do

	it "can be instantiated" do
		Contact.new.should be_an_instance_of(Contact)
	end

	it "can't be saved with any bad name" do
		contact = Contact.new(:name => nil)
		contact.should have(1).error_on(:name)
	end
	it "can't be saved with any bad to" do
		contact = Contact.new(:to => nil)
		contact.should have(1).error_on(:to)
	end
	it "can't be saved with any bad from" do
		contact = Contact.create(:from => nil)
		contact.should have(1).error_on(:from)
	end
	it "can't be saved with any bad subject" do
		contact = Contact.create(:subject => nil)
		contact.should have(1).error_on(:subject)
	end
	it "can't be saved with any bad body" do
		contact = Contact.create(:body => nil)
		contact.should have(1).error_on(:body)
	end

	it "can be saved with valid params" do
		contact = Contact.create!(
			:name => "John", :from => "test@gmail.com", :to => "joraaver@gmail.com", :body => "test", :subject => "test")
		Contact.last.should eq(contact)
	end
		
end
