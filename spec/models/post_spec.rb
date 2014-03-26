require 'spec_helper'

describe Post do
	describe "Post#new" do
		it "should have nil attr" do
			post = Post.new
			post.author.should eq(nil)
			post.text.should eq(nil)
			post.title.should eq(nil)
		end
	end
end
