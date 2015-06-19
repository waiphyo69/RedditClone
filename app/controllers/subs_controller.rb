class SubsController < ApplicationController
  before_action :require_moderator, only: :edit
  def index
    @subs = Sub.all
  end

  def new
    @sub = current_user.subs.new
  end

  def create
    @sub = current_user.subs.new(sub_params)
    if @sub.save
      redirect_to sub_url(@sub)
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :new
    end
  end

  def edit
    @sub = Sub.find(params[:id])
  end


  def update
    @sub = Sub.find(params[:id])
    if @sub.update_attributes(sub_params)
      redirect_to sub_url(@sub)
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :edit
    end
  end


  def show
    @sub = Sub.find(params[:id])
  end


  private
  def sub_params
    params.require(:sub).permit(:title,:moderator_id,:description)
  end
end
