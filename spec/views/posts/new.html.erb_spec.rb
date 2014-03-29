require 'spec_helper'

describe "posts/new.html.erb" do
	it "should have all form inputs" do
    @post = Post.new
		render
		rendered.should include("Title")
		rendered.should include("Author")
		rendered.should include("Text")
	end

end
