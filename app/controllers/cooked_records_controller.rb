class CookedRecordsController < ApplicationController
  before_action :authenticate_user!

  def create
    @recipe = Recipe.find(params[:recipe_id])
    cooked_record = @recipe.cooked_records.new(user_id: current_user.id)
    if cooked_record.save
      redirect_to request.referer
    else
      redirect_to request.referer
    end
  end

  def destroy
    @recipe = Recipe.find(params[:recipe_id])
    cooked_record = @recipe.cooked_records.find_by(user_id: current_user.id)
    if cooked_record.present?
        cooked_record.destroy
        redirect_to request.referer
    else
        redirect_to request.referer
    end
  end
end
