class UsersController < ApplicationController


  def index
  end

  def edit
  end

  def show
  end

  def logout
  end

  def item_management
    @item = Item.where(user_id: current_user.id)
  end

end
