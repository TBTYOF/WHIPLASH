class BlogsController < ApplicationController
  def index
    @blogs = Blog.page(params[:page]).reverse_order
    @info_user = current_user
    @create_user = current_user
    @create_new = Blog.new
  end

  def show
    @blog = Blog.find(params[:id])
    @info_user = @blog.user
    @login_user = current_user
    @create_user = current_user
    @create_new = Blog.new
    @comment = Comment.new
    @comments = @blog.comments.page(params[:page]).reverse_order
  end

  def new
    @blog = Blog.new
  end
  def create
    blog = Blog.new(blog_params)
    blog.user_id = current_user.id
    blog.save
    redirect_to blog_path(blog.id)
  end

  def edit
    @blog = Blog.find(params[:id])
  end
  def update
    blog = Blog.find(params[:id])
    blog.update(blog_params)
    redirect_to blog_path(blog)
  end

  def destroy
    blog = Blog.find(params[:id])
    blog.destroy
    redirect_to blogs_path
  end

  def blog_params
    params.require(:blog).permit(:title, :blog_body, :blog_image, :user)
  end
end
