class RecipesController < ApplicationController
   before_action :set_recipe, only: [:destroy, :show, :edit, :update]
  
  def index
    @recipes = Recipe.all.order(created_at: :desc)
    # if params[:reciep_type_id].present?
    #     @recipes = RecipeType.find(params[:recipe_type_id]).recipes
    # else
    #     @recipes = Recipe.all.order(created_at: :desc)
    # end
    # @recipes = params[:reciep_type_id].present? ? RecipeType.find(params[:recipe_type_id]).recipes : Recipe.all
  end

  def new
    @recipe = Recipe.new
  end
  
  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      flash[:notice] = "投稿できたよ！"
      redirect_to root_path
    else
      render("recipes/new")
    end
  end

  def show
  end

  def edit 
  end

  def update
    if @recipe.update(recipe_params)
     flash[:notice] = "編集できたよ！"
     redirect_to root_path
    else
      render("recipes/edit")
    end
  end

  def destroy
    @recipe.destroy
    flash[:notice] = "削除できたよ！"
    redirect_to root_path
  end

  def search
    if params[:q]
      @q = Recipe.ransack(params[:q])
      @recipes = @q.result(distinct: true)
    elsif params[:tag_id]
      @tag = Tag.find(params[:tag_id])
      @recipes = @tag.recipes.all
    end
  end


  private
  def recipe_params
    params.require(:recipe).permit(:title, :subtitle, :ingredient, :method, :point, :recipe_type_id, :image, tag_ids: []).merge(user_id: current_user.id)
  end

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

end
