require 'rails_helper'

RSpec.describe "Orders", type: :request do
  describe "GET /index" do


    it "renders the index view" do
      FactoryBot.create_list(:order, 10)
      get orders_path
      expect(response).to render_template(:index)
    end


  end

  describe "get order_path" do
    it "renders the :show template" do
      order = FactoryBot.create(:order)
      get order_path(id: order.id)
      expect(response).to render_template(:show)
    end
  end

  describe "get new_order_path" do
    it "renders the :new template" do
      get new_order_path
      expect(response).to render_template(:new)
    end
  end

  describe "post orders_path with valid data" do
    it "saves a new entry and redirects to the show path for the entry" do
    customer = FactoryBot.create(:customer)
order_attributes = FactoryBot.attributes_for(:order, customer_id: customer.id)
      expect {
        post orders_path, params: { order: order_attributes }
      }.to change(Order, :count).by(1)

      expect(response).to redirect_to order_path(id: Order.last.id)
    end
  end

  describe "post orders_path with invalid data" do
    it "does not save a new entry or redirect" do
      customer = FactoryBot.create(:customer)
      order_attributes = FactoryBot.attributes_for(:order)
      order_attributes.delete(:product_name)

      expect {
        post orders_path, params: { order: order_attributes }
      }.to_not change(Order, :count)

      expect(response).to render_template(:new)
    end
  end

  describe "get edit_order_path" do
    it "renders the :edit template" do
      order = FactoryBot.create(:order)
      get edit_order_path(id: order.id)
      expect(response).to render_template(:edit)
    end
  end

  describe "put order_path with valid data" do
    it "updates an entry and redirects to the show path for the order" do
      order = FactoryBot.create(:order)
      put order_path(id: order.id), params: { order: { product_name: "new product name" } }
      order.reload
      expect(order.product_name).to eq("new product name")

      expect(response).to redirect_to order_path(id: order.id)
    end
  end

  describe "put order_path with invalid data" do
    it "does not update the order record or redirect" do
      order = FactoryBot.create(:order)
      put order_path(id: order.id), params: { order: { product_name: nil } }
      order.reload
      expect(order.product_name).to_not eq(nil)

      expect(response).to render_template(:edit)
    end
  end
end
