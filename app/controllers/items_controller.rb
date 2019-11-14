class ItemsController < ApplicationController

  # before_action :set_parents, only: [:new, :create,]

  def index
    
  end

  def new
    @item = Item.new
    @item.build_brand
    @item.build_size
    @item.build_category
    @parents = Category.all.order("id ASC").limit(13)
  end

  def get_category_children
    #選択された親カテゴリーに紐付く子カテゴリーの配列を取得
    @category_children = Category.find(params[:parent_id]).children
  end

  # 子カテゴリーが選択された後に動くアクション
  def get_category_grandchildren
    #選択された子カテゴリーに紐付く孫カテゴリーの配列を取得
    @category_grandchildren = Category.find(params[:child_id]).children
  end





  def create
    @item = Item.new(item_params)
    if @item.save!(validate: false)
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :description, :status, :prefecture, :fee, :arrival, :category_id,
    size_attributes: [:id, :size, :category_id],
    brand_attributes: [:id, :name],
    category_attributes: [:id, :name],
    images_attributes: [:id, :image_url])
  end

  def set_parents
  
  end

end
