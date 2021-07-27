require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests/examples here
    it "has product in database" do
      category = Category.create(name: "Books")
      product = Product.create(name: "The best Sci-Fi story", price: 100, quantity: 3, category: category)
      expect(product).to be_present
    end
    # validates :name, presence: true
    it "is not valid without product name" do
      category = Category.create(name: "Books")
      product = Product.create(name: nil, price: 100, quantity: 3, category: category)
      expect(product.errors.full_messages).to include "Name can't be blank"
    end
    # validates :price, presence: true
    it "is not valid without product name" do
      category = Category.create(name: "Books")
      product = Product.create(name: "The best Sci-Fi story", price: nil, quantity: 3, category: category)
      expect(product.errors.full_messages).to include "Price can't be blank"
    end
    # validates :quantity, presence: true
    it "is not valid without product name" do
      category = Category.create(name: "Books")
      product = Product.create(name: "The best Sci-Fi story", price: 100, quantity: nil, category: category)
      expect(product.errors.full_messages).to include "Quantity can't be blank"
    end
    # validates :category, presence: true
    it "is not valid without product name" do
      category = Category.create(name: "Books")
      product = Product.create(name: "The best Sci-Fi story", price: 100, quantity: 3, category: nil)
      expect(product.errors.full_messages).to include "Category can't be blank"
    end
  end
end