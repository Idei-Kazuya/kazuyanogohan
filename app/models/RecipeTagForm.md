# Formオブジェクト
class RecipeTagForm
  include ActiveModel::Model
  attr_accessor :title, :subtitle, :ingredient, :method, :point, :recipe_type_id, :tag_name, :user_id, :id, :created_at, :updated_at

  def save
    recipe = Recipe.create(title: title, subtitle: subtitle, ingredient: ingredient, method: method, point: point, recipe_type_id: recipe_type_id, user_id: user_id)
    tag = Tag.where(name: tag_name).first_or_initialize
    tag.save
    RecipeTag.create(recipe_id: recipe.id, tag_id: tag.id)
  end
 
  def update(params, recipe)
    #  Recipe.update(title: title, subtitle: subtitle, ingredient: ingredient, method: method, point: point, recipe_type_id: recipe_type_id, user_id: user_id)
    #  Tag.update(name: tag_name)
    tag_name = params.delete(:tag_name)
    recipe.update(params)
    if # 新しい名前のタグが作られた場合
      Tag.create(name: tag_name)
    elsif # 既存のタグに書き換えられた場合
      # 中間テーブルが変わる
    else # タグはいじらない

    end
  end
end


# 以下recipes_controller.rb内記述
  def new
    @recipe = Recipe.new
    # @recipe_tag_form = RecipeTagForm.new
  end
  
  def create
    @recipe = Recipe.new(recipe_params)
    # @recipe_tag_form = RecipeTagForm.new(recipe_params)
    if @recipe.save
    # if @recipe_tag_form.save
      flash[:notice] = "投稿できたよ！"
      redirect_to root_path
    else
      render("recipes/new")
    end
  end

  def show
  end

  def edit 
    # recipe_attributes = @recipe.attributes   # @recipeの情報を抽出する
    # @recipe_tag_form = RecipeTagForm.new(recipe_attributes)
    # @recipe_tag_form.tag_name = @recipe.tags
  end

  def update
    # recipe_attributes = @recipe.attributes   # @recipeの情報を抽出する
    # @recipe_tag_form = RecipeTagForm.new(recipe_attributes)
    # @recipe_tag_form.update(recipe_params, @recipe)
    if @recipe.update(recipe_params)
    # if @recipe_tag_form.valid? # バリデーションにかかっていないないか？かかっていなければtrue
     flash[:notice] = "編集できたよ！"
     redirect_to root_path
    else
      render("recipes/edit")
    end
  end