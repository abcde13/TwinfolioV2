require 'spec_helper'

describe User do
	it "can be instantiated" do
		User.new.should be_an_instance_of(User)
	end
	it "can't be saved with any bad title" do
		user = User.new(:username => nil)
		user.should have(1).error_on(:username)
	end
	it "can't be saved with any bad pxx" do
		user = User.new(:password => nil)
		user.should have(1).error_on(:password)
	end

	it "can be saved with valid params" do
	user = User.create!(
		:username => "good", :password => "test", :salt => "2345")
		User.last.should eq(user)
	end
	it "shouldn't store plaintext pxx" do
		user = User.create(:username => 'good',:password => 'test')
		user.password.should eq(nil)
	end

	it "should authenticate a good match" do
		user = User.create(:username => 'good', :password => 'test')
		User.authenticate('good','test').should eq(user)
	end

	it "should NOT authenticate a bad match" do
		user = User.create(:username => 'good', :password => 'test')
		User.authenticate('good','false').should_not eq(user)
	end
end
