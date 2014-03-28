require 'spec_helper'

describe PostsController do
	render_views

  describe "Post #new" do
    it "assigns a new empty Post to @post" do
      get :new
      assigns(:post).author.should eq(nil)
    end
    it "renders the posts/new template" do
      get :new
      response.should render_template "posts/new"
    end
  end

  describe "Post #create" do
    context "with valid attributes" do
      it "saves the new post in the DB"
      it "re-renders the posts/new template"
    end
    context "with invalid attributes" do
      it "fails to save the post in the DB"
      it "re-renders the posts/new template (with an ERROR)"
    end

  end
	
	describe "GET #index" do
		it "recieves 200 OK" do
			get :index
			expect(response.status).to eq(200)
		end

		it "has navigation" do
			get :index
			response.should render_template "layouts/_nav"
		end
	end
	
	describe "GET #show" do
		before{@post = Post.create!(:title => "Day 1", :author => "Suchaaver", :text => "alma mater")}
		it "recieves 200 OK" do
			get :show, id: @post
			expect(response.status).to eq(200)
		end
		it "has navigation" do
			get :show, id: @post
			response.should render_template "layouts/_nav"
		end
	end

	describe "GET #joraaver" do
		it "recieves 200 OK" do
			get :joraaver
			expect(response.status).to eq(200)
		end
	end

	describe "GET #suchaaver" do
		it "recieves 200 OK" do
			get :suchaaver
			expect(response.status).to eq(200)
		end
	end

	describe "Proper nav" do
		it "has right links" do
			get :index
			assert_select("a[href=/posts/joraaver]","Joraaver&#39;s posts")
			assert_select("a[href=/posts/suchaaver]","Suchaaver&#39;s posts")
			assert_select("a[href=/other]","Other")
			assert_select("a[href=/]","Home")
			assert_select("a[href=/contacts/new]","About/Contact us")
		end
	end

  describe "GET New" do
    it "receives 200 OK" do
    end
  end
		
end
