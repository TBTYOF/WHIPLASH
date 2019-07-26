class UsersController < ApplicationController
	def home
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
  end

  def show
    @user = User.find(params[:id])
    @blogs = @user.blogs
    @info_user = @user
    @create_user = current_user
    @create_new = Blog.new
  end

  def edit
    @user = current_user
  end
  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to user_path(user)
  end

  def destroy
  end

  def user_params
    params.require(:user).permit(:name, :profile_text, :profile_image, :mini_profile_text)
  end
end
