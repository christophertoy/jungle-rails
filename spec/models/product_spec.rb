require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'should save successfully with all fields completed' do
      @category = Category.new(name: "Shoes")
      @product = Product.new(
        name: "Nike",
        price: 1000,
        quantity: 5,
        category: @category
      )
      @product.valid?

    end

    it 'should receive an error message when name is not present' do
      @category = Category.new(name: "Shoes")
      @product = Product.new(
        name: nil,
        price: 1000,
        quantity: 5,
        category: @category
      )
      @product.valid?
     
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it 'should receive an error message when price is not present' do
      @category = Category.new(name: "Shoes")
      @product = Product.new(
        name: "Nike",
        price: nil,
        quantity: 5,
        category: @category
      )
      @product.valid?
     
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end

    it 'should receive an error message when quantity is not present' do
      @category = Category.new(name: "Shoes")
      @product = Product.new(
        name: "Nike",
        price: 5000,
        quantity: nil,
        category: @category
      )
      @product.valid?
     
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    it 'should receive an error message when quantity is not present' do
      @category = Category.new(name: "Shoes")
      @product = Product.new(
        name: "Nike",
        price: 5000,
        quantity: 10,
        category: nil
      )
      @product.valid?
     
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end
  end
end
