# require 'rails_helper'

# describe ItemsController do

#   let(:categories) { create_list(:category, 2) }
#   let(:sizes) { create_list(:size, 2) }
#   let(:brands) { create_list(:brand, 2) }
#   let(:shippings) { create_list(:shipping, 2)}
#   let(:images) { create_list(:image, 2)}

#   describe 'GET #index' do
#     it "created_at DESCによって順序付けられたアイテムの配列を設定します" do
#       items = create_list(:item, 4, category_id: categories.first.id, size_id: sizes.first.id, brand_id: brands.first.id, shipping_id: shippings.first.id)
#       binding.pry
#       get :index
#       expect(assigns(:items)).to match(items)
#     end

#     it "renders the :index template" do
#     end
#   end

# end