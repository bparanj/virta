class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end
  
  def create
    @comment = Comment.new(allowed_params)
    if @comment.save
      redirect_to article_url(@comment.article_id), notice: "Successfully created comment."
    else
      render :new
    end
  end
  
  def edit
    @comment = Comment.find(params[:id])
  end
  
  def update
    @comment = Comment.find(params[:id])
    if @comment.update_attributes(allowed_params)
      redirect_to article_url(@comment.article_id), notice: "Successfully updated comment."
    else
      render :edit
    end
  end
  
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    redirect_to article_url(@comment.article_id), notice: "Successfully destroyed comment."
  end
  
  private
  
  def allowed_params
    params.require(:comment).permit!
  end
end
