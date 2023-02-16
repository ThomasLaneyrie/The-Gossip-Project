class CommentsController < ApplicationController
  before_action :authenticate_user, only: [:new, :create] 
  
  def create
      @comment = Comment.new(comment_params)
      @comment.user = current_user
      @comment.save
      redirect_to gossip_path(@comment.gossip)
  end

  def new
    @comment = Comment.create
  end

  def edit
    @comment = Comment.find(params[:id])
    @gossip = Gossip.find(params[:gossip_id])
  end

  def update
    @comment = Comment.find(params[:id])    
    @gossip = Gossip.find(params[:gossip_id])
    @comment.update(comment_params) 
    redirect_to gossip_path(@gossip)
  end

  def comment_params
    params.require(:comment).permit(:content).merge(gossip_id: params[:gossip_id])
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to gossip_path(@comment.gossip)
  end
end
