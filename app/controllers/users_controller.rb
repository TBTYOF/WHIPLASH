class UsersController < ApplicationController
	def home
	end
	def about
	end
  def topic
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @blogs = @user.blogs
  end

  def edit
  end
  def update
  end

  def destroy
  end

  def user_params
    params.require(:user).permit(:name, :profile_text, :profile_image)
  end
end
