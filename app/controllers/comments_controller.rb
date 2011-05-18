class CommentsController < ApplicationController

  def create
    @author = Author.find params[:author_id]
    @article = @author.articles.find params[:article_id]
    @comment = @article.comments.build( :email       => params[:email], 
                                        :body        => params[:body], 
                                        :comment_date=> Time.now)
    @comment.save
    respond_to do |format| #for ajax
      format.html { #tells the request that it is an html
        redirect_to author_article_path(@author, @article)}
        format.js #communicates with comments/create.rjs (js because of this Processing by CommentsController#create as JS in the logs
    end
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
    respond_to do |format| #for ajax
      format.html { #tells the request that it is an html
        redirect_to author_article_path(@author, @article)}
        format.js #communicates with comments/destroy.rjs (js because of this Processing by CommentsController#destroy as JS in the logs
    end
  end
end
