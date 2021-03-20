class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def create
    @recipe = Recipe.find(params[:recipe_id])
    # favorite = @recipe.favorites.new(user_id: current_user.id)
    @favorite = Favorite.create(user_id: current_user.id, recipe_id: @recipe.id)
    redirect_to request.referer
    # if favorite.save
    #   redirect_to request.referer
    # else
    #   redirect_to request.referer
    # end
  end

  def destroy
    @recipe = Recipe.find(params[:recipe_id])
    # favorite = @recipe.favorites.find_by(user_id: current_user.id)
    @favorite = Favorite.find_by(user_id: current_user.id, recipe_id: @recipe.id)
    @favorite.destroy
    redirect_to request.referer
    # if favorite.present?
    #     favorite.destroy
    #     redirect_to request.referer
    # else
    #     redirect_to request.referer
    # end
  end
end


  # def create
  #   favorite = current_user.favorites.build(recipe_id: params[:recipe_id])
  #   favorite.save!
  #   redirect_to recipes_path, success: t('.flash.favorite')
  # end

  # def destroy
  #   current_user.favorites.find_by(recipe_id: params[:recipe_id]).destroy!
  #   redirect_to recipes_path, success: t('.flash.not_favorite')
  # end
# end
