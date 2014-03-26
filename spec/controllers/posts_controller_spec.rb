require 'spec_helper'

describe PostsController do
	render_views
	
	describe "GET index" do
		it "recieves 200 OK" do
			get :index
			expect(response.status).to eq(200)
		end

		it "has navigation" do
			get :index
			response.should render_template "layouts/_nav"
		end
	end
	
	describe "GET show" do
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

	describe "GET joraaver posts" do
		it "recieves 200 OK" do
			get :joraaver
			expect(response.status).to eq(200)
		end
	end

	describe "GET suchaaver posts" do
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
		
end
