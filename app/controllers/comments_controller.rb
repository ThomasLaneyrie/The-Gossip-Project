class CommentsController < ApplicationController
  def create
      @comment = Comment.new(comment_params)
      @comment.user = User.create(first_name:"Thomas", last_name:"Laneyrie",description:"Si chaud today", email:"toto@gmail.com", age:33, city:City.first)
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
