require 'rails_helper'

RSpec.describe 'the customer index page' do 
  it 'displays all customers name' do 
    customer_1 = Customer.create!(name: "Leah Stromboli", birth_year: 1990, is_veteran: true)
    customer_2 = Customer.create!(name: "Millie Diane", birth_year: 2000, is_veteran: false)

    visit "/customers"
    expect(page).to have_content("Customers")
    expect(page).to have_content("Leah Stromboli")
    expect(page).to have_content("Millie Diane")
  end

end