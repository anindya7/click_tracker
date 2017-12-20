require 'uri'
class LinksController < ApplicationController
  before_action :authenticate_user!, except: [:redirect]
  before_action :track_action
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
    # render layout: false
    @this_link=Link.where(token: params[:token]).first
    
    @clicks=Ahoy::Event.where_properties(token: @this_link.token)
    if @clicks
      render json: @clicks
    end
    
  end 
  def redirect
    ahoy.track "Link clicked", token: params[:token]
    
    


    @destination = Link.where(token: params[:token]).first
    redirect_to @destination.url
  end
  def hold
    ahoy.track "Cloaked link clicked", {token: params[:token]}
    @source = Link.where(token: params[:token]).first
    render :layout => false
    
    
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
