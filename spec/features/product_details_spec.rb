require 'rails_helper'

RSpec.feature "Visitor can navigate from the home page to the product detail page by clicking on a product", type: :feature, js: true do

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

  scenario "They click a product and see its details" do

    visit root_path
    first('.actions').click_link('Details')

    save_and_open_screenshot

    expect(page).to have_text "Description"
  end

end
