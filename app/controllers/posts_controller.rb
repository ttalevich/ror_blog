class PostsController < ApplicationController
	before_action :find_post, only: [:show, :edit, :update, :destroy]
	
  def index
		 @posts = Post.all.order("created_at DESC")
  end
	 
	def new
		@post = Post.new #creates a new post and assigns it to an instance variable @post
		 #an @instance variable allows accessing inside a view
	end
	 
	 def create
	 	@post = Post.new(post_params) #referes to private method - because it will not be needed outside posts.erb file
			if @post.save
				 redirect_to @post
			else
				 render 'new' 
			end
	 end
	
	 def show
	 end
	 
	def edit 
	end
	
	def update 
		if @post.update(post_params)
			redirect_to @post
		else 
			render 'edit'
		end
	end
	
	def destroy
		@post.destroy
		redirect_to root_path
	end
	
	 private
	 
		def find_post
			@post = Post.find(params[:id])
		end
		
	 def post_params
			params.require(:post).permit(:title, :body)# must permit variables for security
	 end 
end
