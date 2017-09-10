class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_recipes_path(current_user)
    else
      #rerender new view if validations don't pass
    end
  end
  
  def show
    # @user = current_user
  end
  
  def update
    # require "pry"; binding.pry
    recipe_name = params[:user][:recipes][:name]
    current_user.recipes << Recipe.create(name: recipe_name, owner_id: current_user.id)
    recipe_id = current_user.recipes.last.id
    redirect_to user_recipe_path(current_user, recipe_id)
  end
  
  private
  
  def user_params
    params.require(:user).permit(:username, :password, :recipes_attributes)
  end
end