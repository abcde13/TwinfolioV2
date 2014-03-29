require 'spec_helper'

describe Post do
 
  it "can be instantiated" do
    Post.new.should be_an_instance_of(Post)
  end
  it "can't be saved with any bad title" do
    post = Post.new(:title => nil)
    post.should have(1).error_on(:title)
  end
  it "can't be saved with any bad author" do
    post = Post.new(:author => nil)
    post.should have(1).error_on(:author)
  end
  it "can't be saved with any bad text" do
    post = Post.create(:text => nil)
    post.should have(1).error_on(:text)
  end
  it "can be saved with valid params" do
    post = Post.create!(
      :author => "Joraaver", :text => "test", :title => "RSPEC attr test")
    Post.last.should eq(post)
  end
end 

