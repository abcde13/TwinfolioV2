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

	def joraaver
		@posts = Post.where(:author => "Joraaver Chahal")
	end
	def suchaaver
		@posts = Post.where(:author => "Suchaaver Chahal")
	end
end
