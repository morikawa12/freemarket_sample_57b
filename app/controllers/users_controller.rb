class UsersController < ApplicationController


  def index
  end

  def edit
  end

  def show
    @parents = Category.where(ancestry: nil).limit(13)
  end

  def logout
  end

end
