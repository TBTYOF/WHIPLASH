class UsersController < ApplicationController
  before_action :ensure_correct_user, {only:[:edit, :update]}

  def ensure_correct_user
    if current_user.id != params[:id].to_i
      redirect_to user_path(current_user.id)
    end
  end

	def home
    @blogs = Blog.page(params[:page]).reverse_order
    @side_images = Blog.order("RANDOM()").limit(10)
	end
	def about
	end
  def topic
  end

  def index
    @users = User.page(params[:page]).reverse_order
    @info_user = current_user
    @create_user = current_user
    @create_new = Blog.new
    @side_images = Blog.order("RANDOM()").limit(10)
  end

  def show
    @user = User.find(params[:id])
    @blogs = @user.blogs.page(params[:page]).reverse_order
    @info_user = @user
    @create_user = current_user
    @create_new = Blog.new
    @side_images = @user.blogs.order("RANDOM()").limit(10)
  end

  def edit
    @user = current_user
  end
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to users_path
    else
      render "edit", user: @user
    end
  end

  def destroy
  end

  private
  def user_params
    params.require(:user).permit(:name, :profile_text, :profile_image, :mini_profile_text)
  end
end
