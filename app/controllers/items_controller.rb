class ItemsController < ApplicationController

  before_action :set_parents, only: [:new, :create, :edit, :update]
  before_action :set_item, only: [:update, :edit, :buy, :show, :destroy, :detail, :pay]

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

    if params[:images_id] != nil #パラメーターでimages_idが送られてきたら
      remove_images_at_index(params[:images_id])
    else
      
    end


    if @item.update!(item_params)
      redirect_to root_path
    else
      render :edit
    end

  end

  def detail

  end

  def destroy
    if @item.user.id == current_user.id
      @item.destroy
      redirect_to item_management_user_path(current_user.id)
    else
      redirect_to :back , alert: '削除できません'
    end
  end

  def show
    @items = Item.all
    index=[]
    @items.each_with_index do |item, i|
      if @item.id == item.id
        index << i
      end
    end
    @nav_next = @items.slice(index[0] + 1, 1)
    @nav_prev = @items.slice(index[0] - 1, 1)

    @user_items = @item.user.items
    @category_items = Item.where(category_id: @item.category_id)
  end

  require 'payjp'

  def buy
    @address = current_user.address
    if @item.user_id == current_user.id || @item.product_status != nil
      redirect_to root_path
    else
      
      @card = Card.where(user_id: current_user.id).first
      if @card.blank?

      else
        #Cardテーブルは前回記事で作成、テーブルからpayjpの顧客IDを検索
        Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
        #保管した顧客IDでpayjpから情報取得
        customer = Payjp::Customer.retrieve(@card.customer_id)
        #保管したカードIDでpayjpから情報取得、カード情報表示のためインスタンス変数に代入
        @default_card_information = customer.cards.retrieve(@card.card_id)
      end
    end
  end

  def pay
    if @item.product_status == nil
      card = Card.where(user_id: current_user.id).first
      Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
      Payjp::Charge.create(
      :amount => @item.price.to_s, #支払金額を入力（itemテーブル等に紐づけても良い）
      :customer => card.customer_id, #顧客ID
      :currency => 'jpy', #日本円
      )
      
      @item.product_status = current_user.id.to_i
      @item.save
      redirect_to root_path
    else
      redirect_to root_path
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


  def item_params
    params.require(:item).permit(:name, :price, :description, :status, :prefecture, :fee, :arrival, :category_id, :size_id,:shipping_id,:product_status,:brand_id,
    brand_attributes: [:id, :name],
    images_attributes: [:id, :image]).merge(user_id: current_user.id)
  end

  def set_parents
    #実装の都合上メソッドにしてbefore_actionで呼び出している
    @parents = Category.all.order("id ASC").limit(13)
    @fees = [{id: 1, fee: "送料込み(出品者負担)"}, {id: 2, fee: "着払い(購入者負担)"}]
    @sizes = Size.all
  end

  def set_item
    @item = Item.find(params[:id])
  end

end
