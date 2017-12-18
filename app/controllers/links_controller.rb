require 'uri'
class LinksController < ApplicationController
  before_action :authenticate_user!, except: [:redirect]
  
  def index
    
    @links = Link.where(user: current_user)
    
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
    
    @clicks=Visit.last
    render :json => @clicks
  end 
  def redirect
    ahoy.track "Link clicked", {token: params[:token]}
    
    @destination = Link.where(token: params[:token]).first
    redirect_to @destination.url
  end
  def hold
    ahoy.track "Cloaked link clicked", {token: params[:token]}
    # render :layout => false
    @source = Link.where(token: params[:token]).first
    
  end
  def check_token
    link = Link.where(token: params[:token])
    if link.any?  
      render json: false 
    else
      render json: true
    end
  end
  
  private
    def link_params
      params.require(:link).permit(:name, :url, :token)
    end


    

end
