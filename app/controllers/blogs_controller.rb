class BlogsController < ApplicationController
  def index
    @blogs = Blog.all
  end

  def show
    @blog = Blog.find(params[:id])
  end

  def new
    @blog = Blog.new
  end
  def create
    blog = Blog.new(blog_params)
    blog.save
    redirect_to blog_path(blog)
  end

  def edit
  end
  def update
  end

  def destroy
  end

  def blog_params
    params.require(:blog).permit(:title, :blog_body, :blog_image, :user)
  end
end
