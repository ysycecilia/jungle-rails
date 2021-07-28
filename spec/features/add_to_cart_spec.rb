require 'rails_helper'

RSpec.feature "Visitor can click the 'Add to Cart' button to add a product on the home page to cart with its number increases by one", type: :feature, js: true do

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

  scenario "They click add button and see the cart number changes from 0 to 1" do

    visit root_path
    first('.actions').click_button('Add')

    save_and_open_screenshot

    expect(page).to have_text "My Cart (1)"
  end

end
