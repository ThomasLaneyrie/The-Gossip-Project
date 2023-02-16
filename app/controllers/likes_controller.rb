class LikesController < ApplicationController
  def create
    @like=Like.new(user:current_user,gossip_id:params[:gossip_id])

    if @like.save
      redirect_to gossips_path
    else 
      redirect_to gossips_path, danger: 'Impossible de liker'
    end
  end

  def destroy
    @like = Like.find(params[:id])
    @like.destroy
    redirect_to gossips_path
  end

  # private
  #   def like_params
  #     params.require(:like).permit(:gossip_id)
  #   end
end
