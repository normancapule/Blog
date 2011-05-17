class CommentsController < ApplicationController

  def create
    @author = Author.find params[:author_id]
    @article = @author.articles.find params[:article_id]
    @comments = @article.comments.build
    @comments.email = params[:email]
    @comments.body = params[:body]
    @comments.comment_date = Time.now
    @comments.save
    redirect_to author_article_path(@author, @article)
  end

  def edit
    @author = Author.find params[:author_id]
    @article = @author.articles.find params[:article_id]
    @comment = @articles.comments.find params[:id]
  end

  def update
    @author = Author.find params[:author_id]
    @article = @author.articles.find params[:article_id]
    @comment = @article.comments.find params[:id]
    if @comment.update_attributes(params[:comment])
      redirect_to author_article_path(@author, @article)
    else
     render :action => "new" 
    end
  end

  def destroy
    @author = Author.find params[:author_id]
    @article = @author.articles.find params[:article_id]
    @comment = @article.comments.find params[:id]
    @comment.destroy
      redirect_to author_article_path(@author, @article)
  end
end
