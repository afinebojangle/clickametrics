class WebsitesController < ApplicationController
  before_action :authenticate_user!

  def index
    @websites = current_user.websites.all
  end

  def show
  end

  def new
    @website = Website.new
  end

  def create
    @website = current_user.websites.build(params.require(:website).permit(:url))
    if @website.save
      flash[:notice] = "Website Registered!"
      redirect_to websites_path
    else
      flash[:error] = "There was an error saving your website."
      render :new
    end
  end

  def destroy
    @website = Website.find(params[:id])

    if @website.destroy
      flash[:notice] = "No longer tracking #{@website.url}."
      redirect_to websites_path
    else
      flash[:error] = "There was an error deleting the website."
      render websites_path
    end
  end
end
