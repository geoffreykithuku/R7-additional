require 'rails_helper'

RSpec.describe Order, type: :model do
  subject { Order.new( product_name: "gears", product_count: 7, customer: FactoryBot.create(:customer))}

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a product_name" do
    subject.product_name = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a product_count" do
    subject.product_count = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a customer" do
    subject.customer = nil
    expect(subject).to_not be_valid
  end

  it "is not valid if the product_count is not a number" do
    subject.product_count = "ABC"
    expect(subject).to_not be_valid
  end

  it "is not valid if the product_count is not a whole number" do
    subject.product_count = 3.14
    expect(subject).to_not be_valid
  end

  it "is not valid if the product_count is not a positive number" do
subject.product_count = -1
expect(subject).to_not be_valid

  end

  it "must validate the associated customer" do
    subject.customer.first_name = nil
    expect(subject).to_not be_valid
  end

  it "must validate the associated customer" do
    subject.customer.last_name = nil
    expect(subject).to_not be_valid
  end


end
