class PostsController < ApplicationController

	def index
		@posts = Post.all

		respond_to do |format|
			format.html
			format.xml { render :xml => @posts }
		end
	end

	def show
		@post = Post.find(params[:id])
	end

	def edit
		@post = Post.find(params[:id])
	end

  def new
    @post = Post.new()
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to new_post_path, :flash => {success: "Post has been successfully published."}
    else 
      flash.now[:failure] =  "The post is missing some details. Please fill everything in."
      render :action => :new
    end
  end 

	def joraaver
		@posts = Post.where(:author => "Joraaver Chahal")
	end
	def suchaaver
		@posts = Post.where(:author => "Suchaaver Chahal")
	end

  private 

	def post_params
		params.require(:post).permit(:title, :author,:text)
	end
end
