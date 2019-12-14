require 'rails_helper'

RSpec.describe Item, type: :model do


  describe '#with validation' do

    before do 
      @brand = create(:brand)
      @shipping = create(:shipping)
      @size = create(:size)
      @category = create(:category)
    end

    # it '全て存在すれば登録できる' do
    #   expect(build(:item, brand_id: @brand.id, size_id: @size.id, shipping_id: @shipping.id, category_id: @category.id)).to be_valid
    # end

    it "nameが空では登録できない" do
      item = build(:item, name: nil, brand_id: @brand.id, size_id: @size.id, shipping_id: @shipping.id, category_id: @category.id)
      item.valid?
      expect(item.errors[:name]).to include("can't be blank")
    end

    it "priceが空では登録できない" do
      item = build(:item, price: nil, brand_id: @brand.id, size_id: @size.id, shipping_id: @shipping.id, category_id: @category.id)
      item.valid?
      expect(item.errors[:price]).to include("can't be blank")
    end

    it "descriptionが空では登録できない" do
      item = build(:item, description: nil, brand_id: @brand.id, size_id: @size.id, shipping_id: @shipping.id, category_id: @category.id)
      item.valid?
      expect(item.errors[:description]).to include("can't be blank")
    end

    it "statusが空では登録できない" do
      item = build(:item, status: nil, brand_id: @brand.id, size_id: @size.id, shipping_id: @shipping.id, category_id: @category.id)
      item.valid?
      expect(item.errors[:status]).to include("can't be blank")
    end

    it "prefectureが空では登録できない" do
      item = build(:item, prefecture: nil, brand_id: @brand.id, size_id: @size.id, shipping_id: @shipping.id, category_id: @category.id)
      item.valid?
      expect(item.errors[:prefecture]).to include("can't be blank")
    end

    it "feeが空では登録できない" do
      item = build(:item, fee: nil, brand_id: @brand.id, size_id: @size.id, shipping_id: @shipping.id, category_id: @category.id)
      item.valid?
      expect(item.errors[:fee]).to include("can't be blank")
    end

    it "arrivalが空では登録できない" do
      item = build(:item, arrival: nil, brand_id: @brand.id, size_id: @size.id, shipping_id: @shipping.id, category_id: @category.id)
      item.valid?
      expect(item.errors[:arrival]).to include("can't be blank")
    end

    it "size_idが空では登録できない" do
      item = build(:item, brand_id: @brand.id, size_id: nil, shipping_id: @shipping.id, category_id: @category.id)
      item.valid?
      expect(item.errors[:size_id]).to include("can't be blank")
    end

    it "category_idが空では登録できない" do
      item = build(:item, brand_id: @brand.id, size_id: nil, shipping_id: @shipping.id, category_id: nil)
      item.valid?
      expect(item.errors[:category_id]).to include("can't be blank")
    end

    it "shipping_idが空では登録できない" do
      item = build(:item, brand_id: @brand.id, size_id: nil, shipping_id: nil, category_id: @category.id)
      item.valid?
      expect(item.errors[:shipping_id]).to include("can't be blank")
    end
    

  end
end