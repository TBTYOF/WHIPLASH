class BlogsController < ApplicationController
  def index
    @blogs = Blog.page(params[:page]).reverse_order
    @info_user = current_user
    @create_user = current_user
    @create_new = Blog.new
    @side_images = Blog.order("RANDOM()").limit(10)
    @categorys = Category.order("RANDOM()").limit(10)
  end

  def show
    @blog = Blog.find(params[:id])
    @info_user = @blog.user
    @login_user = current_user
    @create_user = current_user
    @create_new = Blog.new
    @comment = Comment.new
    @comments = @blog.comments.page(params[:page]).reverse_order
    @side_images = @info_user.blogs.order("RANDOM()").limit(10)
    @categorys = @info_user.categorys.order("RANDOM()").limit(10)
  end

  def new
    @blog = Blog.new
    @category = Category.new
  end
  def create
    blog = Blog.new(blog_params)
    blog.user_id = current_user.id
    blog.save
    
    category = Category.new(category_params)
    category.category = blog.category
    category.blog_id = blog.id
    category.user_id = current_user.id
    binding.pry
    category.save
    redirect_to blog_path(blog)
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


  private

  def blog_params
    params.require(:blog).permit(:title, :blog_body, :blog_image, :user, :category)
  end

  def category_params
    params.require(:category).permit(:user, :blog, :category)
  end
end
