class GossipsController < ApplicationController
  def index 
    @gossips = Gossip.all
    @comment = Comment.create
  end 
  
  def show
    @gossip= Gossip.find(params[:id])
  end

  def new
    @gossip = Gossip.create
  end

  def create
    @gossip = Gossip.new(title:params["title"], content:params["content"], user: User.create(first_name:"Thomas", last_name:"Laneyrie",description:"Si chaud today", email:"toto@gmail.com", age:33, city:City.first))
    if @gossip.save
      redirect_to gossip_path(@gossip), success: 'Le Gossip a été créé avec succès'
    else 
      redirect_to new_gossip_path, danger: 'Echec dans la création du Gossip, essaye encore'
    end
  end

  def edit
    @gossip = Gossip.find(params[:id])
  end

  def update
      @gossip = Gossip.find(params[:id])
      if @gossip.update(post_params)  
        redirect_to gossip_path(@gossip.id)
      else
        render :edit
      end
  end

  def destroy
    @gossip = Gossip.find(params[:id])
    @gossip.destroy
    redirect_to gossips_path
end
end

private
def post_params
  params.require(:gossip).permit(:title,:content) 
end
