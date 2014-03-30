require 'spec_helper'

describe "Posts" do
  
  
  context "logged in" do

	let(:params) do {:username => "joraaver", :password => "test"}
	end
	before(:each) do
		 User.create(:username => "joraaver", :password => "test")	
		 post sessions_path, params
	end
	  describe "creating a Post" do
	    context "with valid attr" do
	      it "creates a Post and renders the new template" do
		post_via_redirect posts_path, :post => {:author => "Joraaver", :text => "RSPEC Test", :title => "check" }
		response.body.should include("Post has been successfully published.")
	      end
	    end
	    context "with invalid attr" do
	      it "should say failure" do
		post_via_redirect posts_path, :post => {:author => nil, :text => nil, :title => nil }	
		response.body.should include("The post is missing some details. Please fill everything in.")
	      end
	    end
	  end
	  describe "updating a Post" do
			before{@post = Post.create!(:title => "Day 1", :author => "Suchaaver", :text => "alma mater")}
	    context "with valid attr" do
	      it "updates the Post and redirects to the show template" do
		patch_via_redirect post_path(@post), :post => {:author => "Joraaver"}
		response.body.should include("Post has been successfully updated.")
	      end
	    end
	    context "with invalid attr" do
	      it "should say failure" do
		patch_via_redirect post_path(@post), :post => {:author => nil}
		response.body.should include("The post is missing some details. Please fill everything in.")
	      end
	    end
	  end

	  describe "deleting a Post" do
			before{@post = Post.create!(:title => "Day 1", :author => "Suchaaver", :text => "alma mater")}
	    it "deletes the Post and redirects to the posts#index with a flash[success]" do
	      delete_via_redirect post_path(@post)
	      response.body.should include("Post successfully deleted.")
	    end
	  end
	end


end

