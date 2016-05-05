class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end
  
  def show
    @article = Article.find(params[:id])
    @comment = Comment.new(article: @article)
  end
  
  def new
    @article = Article.new
  end
  
  def create
    @article = Article.new(allowed_params)
    if @article.save
      redirect_to articles_path, notice: "Successfully created article."
    else
      render :new
    end
  end
  
  def edit
    @article = Article.find(params[:id])
  end
  
  def update
    @article = Article.find(params[:id])
    if @article.update_attributes(allowed_params)
      redirect_to articles_path, notice: "Successfully updated article."
    else
      render :edit
    end
  end
  
  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_url, notice: "Successfully destroyed article."
  end
  
  private
  
  def allowed_params
    params.require(:article).permit!
  end
end
