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
    @sizes = Size.all
    @fees = [{id: 1, fee: "送料込み(出品者負担)"}, {id: 2, fee: "着払い(購入者負担)"}]
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

  def get_size
    grandchild_id = Category.find(params[:grandchild_id]).id
        # 大人の洋服サイズ
    if grandchild_id.between?(36,95) || grandchild_id.between?(106,107) || grandchild_id.between?(204,218) || grandchild_id.between?(224,266) || grandchild_id.between?(289,292) || grandchild_id.between?(359,360)
      @sizes = Size.find(1).children
        # 女性の靴サイズ
    elsif grandchild_id.between?(96,104)
      @sizes = Size.find(2).children
        # 男性の靴サイズ
    elsif grandchild_id.between?(268,274)
      @sizes = Size.find(3).children
        # キッズの洋服小サイズ
    elsif grandchild_id.between?(364,389)
      @sizes = Size.find(4).children
        # キッズの洋服大サイズ
    elsif grandchild_id.between?(391,429)
      @sizes = Size.find(5).children
        # キッズの靴サイズ
    elsif grandchild_id.between?(431,434)
      @sizes = Size.find(6).children
    end
  end

  def get_shipping
    @shipping_children = Shipping.find(params[:fee_id]).children
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
    params.require(:item).permit(:name, :price, :description, :status, :prefecture, :fee, :arrival, :category_id, :size_id,:shipping_id,
    size_attributes: [:id, :size, :category_id],
    brand_attributes: [:id, :name],
    category_attributes: [:id, :name],
    images_attributes: [:id, :image_url])
  end

  def set_parents
  
  end

end
