require "spec_helper"

describe Notifier do
	
	before(:each) do
		ActionMailer::Base.delivery_method = :test
		ActionMailer::Base.perform_deliveries = true
		ActionMailer::Base.deliveries = []
		@contact = Contact.create(:name => "J", :to => 'Joraaver', :from => 'temp@example.com', :subject => 'test', :body => 'test')
		Notifier.send_mail(@contact).deliver
	end

	after(:each) do
		ActionMailer::Base.deliveries.clear
	end

	it "should send an email" do
		ActionMailer::Base.deliveries.count.should eq(1)
	end
	it "should have the right reciever" do
		ActionMailer::Base.deliveries.first.to.should eq(['joraaverchahal@gmail.com'])
	end
	it "should have the right subject" do
		ActionMailer::Base.deliveries.first.subject.should eq(@contact.subject)
	end
	it "should have the right sender" do
		ActionMailer::Base.deliveries.first.from.should eq(['temp@example.com'])
	end

end
