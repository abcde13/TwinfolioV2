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
  it "can't be updated with a bad title" do
    @post = Post.create!(:author => "Joraaver", :text => "test", :title => "RSPEC attr test")
    @attr = { :title => nil, :author => "Suchaaver"}
    @post.update(@attr)
    @post.should have(1).error_on(:title)
  end
  it "can't be updated with a bad author" do
    @post = Post.create!(:author => "Joraaver", :text => "test", :title => "RSPEC attr test")
    @attr = { :title => 'Great', :author => nil}
    @post.update(@attr)
    @post.should have(1).error_on(:author)
  end
  it "can't be updated with a bad text" do
    @post = Post.create!(:author => "Joraaver", :text => "test", :title => "RSPEC attr test")
    @attr = { :title => 'Great', :text => nil}
    @post.update(@attr)
    @post.should have(1).error_on(:text)
  end
  it "can be saved with valid params" do
    @post = Post.create!(:author => "Joraaver", :text => "test", :title => "RSPEC attr test")
    @attr = { :title => 'Great', :text => "Update Test"}
    @post.update(@attr)
    @post.reload
    expect(@post.title).to eq(@attr[:title])
    expect(@post.text).to eq(@attr[:text])
  end

  it "can be destroyed" do
		@post = Post.create!(:title => "Day 1", :author => "Suchaaver", :text => "alma mater")
    expect{@post.destroy}.to change(Post, :count).by(-1)
  end
end 

