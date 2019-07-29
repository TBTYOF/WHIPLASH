class BlogsController < ApplicationController
before_action :ensure_correct_user, {only:[:edit, :update]}

  def ensure_correct_user
    if current_user.id != params[:id].to_i
      redirect_to blogs_path
    end
  end


  def index
    @blogs = Blog.page(params[:page]).reverse_order
    @info_user = current_user
    @create_user = current_user
    @create_new = Blog.new
    @side_images = Blog.order("RANDOM()").limit(10)
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
  end

  def new
    @blog = Blog.new
  end
  def create
    @blog = Blog.new(blog_params)
    @blog.user_id = current_user.id
    if @blog.save
      redirect_to blog_path(@blog), notice: 'You have creatad blog successfully.'
    else
      render new_blog_path, blog: @blog
    end
  end

  def edit
    @blog = Blog.find(params[:id])
  end
  def update
    @blog = Blog.find(params[:id])
    if @blog.update(blog_params)
      redirect_to blog_path(@blog), notice: 'You have updated blog successfully'
    else
      render :edit, blog: @blog
    end
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

end
