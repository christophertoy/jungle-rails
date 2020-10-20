require 'rails_helper'

RSpec.feature "Visitor navigates from the home page to the product detail page", type: :feature, js:true do
  
    # SETUP
    before :each do
      @category = Category.create! name: 'Apparel'
  
      10.times do |n|
        @category.products.create!(
          name:  Faker::Hipster.sentence(3),
          description: Faker::Hipster.paragraph(4),
          image: open_asset('apparel1.jpg'),
          quantity: 10,
          price: 64.99
        )
      end
    end

    scenario 'They see the product details' do

    # Visit the home page
    visit root_path
    # Find a product + click on details button
    first('article.product').find_link('Details').click
    # View the product detail page

    expect(page).to have_css 'section.products-show', count: 1
    expect(page).to have_content('Quantity')
    # save_screenshot

  end
end
