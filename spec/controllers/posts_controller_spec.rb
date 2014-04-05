require 'spec_helper'

describe PostsController do
	render_views


  describe "POST #create" do
		subject { post :create, :post => {:author => "Joraaver", :text => "RSPEC Test", :title => "check" }}
    context "with valid attributes" do
      it "redirects to the posts/new template" do
				expect(subject).to redirect_to(:action => :new)
      end
    end
    context "with invalid attributes" do
      it "re-renders the posts/new template (with an ERROR)" do
		    post :create, :post => {:author => nil, :text => nil, :title => nil }  
        response.should render_template(:new)
      end
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
			assert_select("a[href=/]","All posts")
			assert_select("a[href=/contacts/new]","About/Contact us")
		end
	end

	describe "not logged in" do
		before {@post  = Post.create(:author => 'Joraaver', :text => 'test', :title => 'Day 3')  }
		it "should not be able to access posts/new" do
			get :new
			response.should redirect_to posts_path
		end
		it "should not be able to access posts/x/edit" do
			get :edit, id: @post
			response.should redirect_to posts_path
		end
	end
		

  describe "GET New" do
    it "receives 200 OK" do
    end
  end
		
end
