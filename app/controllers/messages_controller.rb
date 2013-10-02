class MessagesController < ApplicationController
 before_filter :find_message, only: [:show, :destroy]
 before_filter :check_if_author, only: [:destroy]
  def index
    @messages = Message.scoped
    @message = Message.new
  end

  def show
  end

  def new
    @message = Message.new(:parent_id => params[:parent_id])
  end

  def create
    @message = Message.new(params[:message].permit(:content, :parent_id))
    @message.author_id=current_user.id
    if @message.save
      redirect_to messages_url
    else
      render :new
    end
  end

  def destroy
    
    @message.destroy
    redirect_to messages_url
  end

  private
  def find_message
   @message = Message.find(params[:id])
  end

  def check_if_author
   redirect_to :back unless current_user.id==@message.user_id || current_user.id==@message.author_id
  end
end
