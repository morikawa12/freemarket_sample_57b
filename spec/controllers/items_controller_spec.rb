require 'rails_helper'

describe ItemsController do

  let(:categories) { create_list(:category, 2) }
  let(:sizes) { create_list(:size, 2) }
  let(:brands) { create_list(:brand, 2) }
  let(:shippings) { create_list(:shipping, 2)}

  describe 'GET #index' do
    it "populates an array of items ordered by created_at DESC" do
      items = create_list(:item, 4, category_id: categories.first.id, size_id: sizes.first.id, brand_id: brands.first.id, shipping_id: shippings.first.id)
      get :index
      expect(assigns(:items)).to match(items)
    end

    it "renders the :index template" do
    end
  end

end