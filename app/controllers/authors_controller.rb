class AuthorsController < ApplicationController
  def index
    @authors = Author.all
  end
  
  def show
    @authors = Author.find(params[:id])
  end

  def new
    @authors = Author.new
  end

  def edit
    @authors = Author.find(params[:id])
  end

  def create
    @authors = Author.new(params[:author])
    if @authors.save
      redirect_to authors_path
    else
      render :action => "new"
    end
  end

  def update
    @authors = Author.find(params[:id])
    if @authors.update_attributes(params[:author])
      redirect_to authors_path
    else
      render :action => "new"
    end
  end

  def destroy
    @authors = Author.find(params[:id])
    @authors.destroy
    redirect_to authors_path
  end

end
