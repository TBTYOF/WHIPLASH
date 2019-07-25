class BlogsController < ApplicationController
  def index
  end

  def show
  end

  def new
  end
  def create
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
