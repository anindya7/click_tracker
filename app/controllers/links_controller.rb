class LinksController < ApplicationController
  before_action :authenticate_user! 
  def index
    @links = Link.all
  end

  def new
    @link = Link.new
  end

  def create
    @link = Link.new(link_params)
    @link.user = current_user
    @link.save
    flash[:notice] = "Link created"
    redirect_to links_path
  end

  def edit

  end

  def update

  end

  def show

  end 
  def redirect

  end
  def check_token
    link = Link.where(token: params[:token])
    if link.any  
      render json: false 
    else
      render json: true
    end
  end
  def redirect

  end
  private
    def link_params
      params.require(:link).permit(:name, :url, :token)
    end

end
