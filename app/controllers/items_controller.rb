class ItemsController < ApplicationController
  def index
    
  end

  def new
    @item = Item.new
    @parents = Category.all.order("id ASC").limit(13)
    @item.build_brand
    @item.build_size
    @item.build_category
  end

  def create
    @item = Item.new(item_params)
    @item.save
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :description, :status, :prefecture, :fee, :arrival,
    size_attributes: [:id, :size, :category_id],
    brand_attributes: [:id, :name],
    category_attributes: [:id, :name],
    images_attributes: [:id, :image_url])
  end

end
