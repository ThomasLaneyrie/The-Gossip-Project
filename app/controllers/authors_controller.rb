class AuthorsController < ApplicationController
  def index
    @authors = User.all
  end

  def show
    @author = User.find(params[:id])
  end

  def new
    @author = User.new
  end

  def create
    if params[:password] == params[:confirm_password]
      @author = User.new(first_name:params["first_name"],last_name:params["last_name"],description:params["description"],email:params["email"],age:params["age"].to_i,password:params[:password])
      @author.city = City.all.sample
      if @author.save
        redirect_to home_path, success: "Nouvel utilisateur créé avec succès, bienvenue #{@author.first_name}"
      else  
        redirect_to new_author_path, danger: "Problème à la création de votre compte"
      end
    else
      redirect_to new_author_path, danger: "Les 2 mots de passe ne correspondent pas"
    end
  end
end
