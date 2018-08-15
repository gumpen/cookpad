class MyfoldersController < ApplicationController
  protect_from_forgery except: [:create, :destroy]

  def index
    @user = User.find(current_user.id)
    @recipes = []
    @user.myfolders.each do |myfolder|
      @recipes.push(myfolder.recipe)
    end
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    unless @recipe.register_to_myfolder?(current_user)
      @recipe.register_to_myfolder(current_user)
      respond_to do |format|
        format.html { redirect_to request.referrer || root_url }
        format.json
      end
    end
  end

  def destroy
    @recipe = Myfolder.find(params[:id]).recipe
    if @recipe.register_to_myfolder?(current_user)
      @recipe.unregister_from_myfolder(current_user)
      respond_to do |format|
        format.html { redirect_to request.referrer || root_url }
        # format.json{ @recipe = Recipe.find(params[:post_id]}
        format.json
      end
    end
  end
end
