class ArticlesController < ApplicationController
  before_action :set_article, only: [:destroy, :show, :edit, :update]

  def index
    @articles = Article.all.order(created_at: :desc)
  end

  def new
    @article= Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:notice] = "投稿できたよ！"
      redirect_to articles_path
    else
      render("articles/new")
    end
  end

  def show
  end

  def edit 
  end

  def update
    if @article.update(article_params)
     flash[:notice] = "編集できたよ！"
     redirect_to articles_path
    else
      render("articles/edit")
    end
  end

  def destroy
    @article.destroy
    flash[:notice] = "削除できたよ！"
    redirect_to articles_path
  end

  def search
      # @article_type = ArticleType.find(params[:article_type_id])
      # @articles = @article_type.articles.all
  end

  private
  def article_params
    params.require(:article).permit(:title, :text, :image, :article_type_id).merge(user_id: current_user.id)
  end

  def set_article
    @article = Article.find(params[:id])
  end

end
