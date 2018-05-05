class CommentsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource


  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.new(comment_params)
    @comment.users << current_user
    @comment.save
    redirect_to article_path(@article)
  end

  def destroy
    article = @comment.article.id
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to article_url(article), notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:user_id ,:title, :content)
  end


end
