require 'rails_helper'

RSpec.feature "Vistor adds product to cart", type: :feature, js: true do
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

  scenario 'My Cart changes from 0 to 1 when product added' do
    # navigate to home page
    visit root_path

    # check that My Cart is empty

    expect(page).to have_text "My Cart (0)"

    # find product + click add
    first('article.product').find_button('Add').click

    # check that item has been added to My Cart

    expect(page).to have_text "My Cart (1)"

    # save_screenshot

  end

end
