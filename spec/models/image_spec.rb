require 'rails_helper'

RSpec.describe Image, type: :model do

  describe '#with validation' do
  
    it "必須項目が存在すれば登録できる" do
      image = build(:image)
      expect(image).to be_valid
    end

    it "image_urlが空では登録できない" do
      image = build(:image, image_url: "aaaaa")
      binding.pry
      image.valid?
      expect(image.errors[:image_url]).to include("can't be blank")
    end

  end

end