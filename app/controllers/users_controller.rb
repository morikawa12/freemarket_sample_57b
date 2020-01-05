class UsersController < ApplicationController


  def index
  end

  def edit
  end

  def show
  end

  def login
  end

  def logout
  end

  def item_management
    @item = current_user.items.order("created_at DESC")
  end

end
