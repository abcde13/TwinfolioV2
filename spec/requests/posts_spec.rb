require 'spec_helper'

describe "Posts" do
  
  
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
end

