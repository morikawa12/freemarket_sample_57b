class ItemsController < ApplicationController

  before_action :set_parents, only: [:new, :create, :edit, :update]

  def index
    @items = Item.all.order("created_at DESC").includes(:images)
  end

  def new
    @item = Item.new
    @item.build_brand    #fields_forでbrandモデルに保存するための記述
    @item.images.build   #fields_forでimageモデルに保存するための記述
    @number = [0,1,2,3,4]
  end 

  # 親カテゴリーが選択された後に動くアクション(子)
  def get_category_children
    #選択された親カテゴリーに紐付く子カテゴリーの配列を取得
    @category_children = Category.find(params[:parent_id]).children
  end

  # 子カテゴリーが選択された後に動くアクション(孫)
  def get_category_grandchildren
    #選択された子カテゴリーに紐付く孫カテゴリーの配列を取得
    @category_grandchildren = Category.find(params[:child_id]).children
  end

  #孫カテゴリーが選択された後に動くアクション(サイズ)
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

  #配送料の負担項目が選択された後に動くアクション(配送の方法)
  def get_shipping
    #選択された配送料の負担(送料込みor着払い)に紐づく子カテゴリーの配列を取得
    @shipping_children = Shipping.find(params[:fee_id]).children
  end



  def create
    @item = Item.new(item_params)
    if @item.save!
      redirect_to root_path
    else
      redirect_to new_item_path
    end
  end

  def edit
    @item = Item.find(params[:id])
    @parent = Category.find(@item.category_id).parent.parent.id
    @child = Category.find(@item.category_id).parent.parent.children
    @grand_child = Category.find(@item.category_id).parent.children
    @shipping = Shipping.find(@item.shipping_id).parent.children
    @shipping_select = Shipping.find(@item.shipping_id)
    @images =  @item.images
    if @item.size_id != nil
    @size = Size.find(@item.size_id).parent.children
    @select_size = Size.find(@item.size_id)
    else
      return
    end


  end

  def update
    @item = Item.find(params[:id])
    
    if params[:images_id] != nil #パラメーターでimages_idが送られてきたら
      remove_images_at_index(params[:images_id])
    else
      
    end

    # if params[:images_id] != nil && params[:item][:images_attributes] != nil 
    #   add_images(params[:images_id], params[:item][:images_attributes])
    # else

    # end

    if @item.update!(item_params)
      # image_id = params[:images_id]
      # image_id_index = []

      # image_id.each do |image_id|
      #   image_id_index << image_id.to_i
      # end

      # index = image_id.length

      # array_images = @item.images
      # reverse_array_images = array_images.reverse
      # another_array_images = reverse_array_images[0..index - 1]
      # another_array_images.zip(image_id_index) do |new_image, i|
      #   array_images[i]
      #   binding.pry
      # end
      # @item.images = array_images
      # binding.pry
      redirect_to root_path
    else
      render :edit
    end

  end

  private

  def remove_images_at_index(index)
    remain_images = @item.images # 画像の配列をコピーする

    index.each do |index| #パラメータデー送られてきたimages_idの配列をeachで回す
      index = index.to_i #images_idはstring型なのでinteger柄に変換
      deleted_image = remain_images[index].delete #配列の位置を指定して削除
      deleted_image.try(:remove!)  # S3から削除する場合追加
    end

  end

  # def add_images(index, new_image)
  #   images = @item.images

  #   index.zip(new_image) do |index, new_image|
  #     index = index.to_i
  #     binding.pry
  #     images.insert(index, new_image)
  #   end

  # end

  def item_params
    params.require(:item).permit(:name, :price, :description, :status, :prefecture, :fee, :arrival, :category_id, :size_id,:shipping_id,:product_status,:user_id,:brand_id,
    brand_attributes: [:id, :name],
    images_attributes: [:id, :image])
  end

  def set_parents
    #実装の都合上メソッドにしてbefore_actionで呼び出している
    @parents = Category.all.order("id ASC").limit(13)
    @fees = [{id: 1, fee: "送料込み(出品者負担)"}, {id: 2, fee: "着払い(購入者負担)"}]
    @sizes = Size.all
  end

end
