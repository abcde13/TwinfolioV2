require 'spec_helper'

describe 'posts/show' do
	it 'should have a complete post' do
		@post = stub_model(Post, :author => "Joraaver", :title => "Day 2", :text => "alma mater")
		render
		rendered.should include("Day 2")
		rendered.should include("Joraaver")
		rendered.should include("alma mater")
	end
end
