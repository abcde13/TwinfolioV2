require 'spec_helper'

describe "posts/index" do
	it "renders list of all posts" do
		assign(:posts,[
			stub_model(Post, :author => "Suchaaver", :title => "Day 1", :text => "lorem ipsum"),
			stub_model(Post, :author => "Joraaver", :title => "Day 2", :text => "alma mater")])
		render
		rendered.should include("Suchaaver")
		rendered.should include("Day 1")
		rendered.should include("lorem ipsum")
		rendered.should include("Joraaver")
		rendered.should include("Day 2")
		rendered.should include("alma mater")
	
	end

		
end
