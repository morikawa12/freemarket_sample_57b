class UsersController < ApplicationController

  before_action :authenticate_user!, only: [:index, :edit, :update, :logout, :show, :item_management, :card]

  def index
  end

  def edit
  end

  def show
    @parents = Category.where(ancestry: nil).limit(13)
  end

  def logout
    @parents = Category.where(ancestry: nil).limit(13)
  end

  def update
  end

  def item_management
    @items = current_user.items.order("created_at DESC")
  end

  def card
    card = Card.where(user_id: current_user.id)
    redirect_to card_index_path if card.exists?
  end
end
