require 'rails_helper'

RSpec.describe 'the customer index page' do 
  it 'displays all customers name' do 
    customer_1 = Customer.create!(name: "Leah Stromboli", birth_year: 1990, is_veteran: true)
    customer_2 = Customer.create!(name: "Millie Diane", birth_year: 2000, is_veteran: false, created_at: 1.year.ago)

    visit "/customers"
    save_and_open_page
    expect(page).to have_content(customer_1.name)
    expect(page).to have_content(customer_1.created_at)
    expect(page).to have_content(customer_2.name)
    expect(page).to have_content(customer_2.created_at)
    
    expect(customer_2.name).to appear_before(customer_1.name)
  end

  it 'can create a new customer' do
    customer_1 = Customer.create!(name: "Tryntle", birth_year: 1950, is_veteran: true)
    visit '/customers'

    click_link 'New Customer'

    expect(current_path).to eq('/customers/new')

    fill_in 'Name', with: 'Tryntle'
    fill_in 'Birth year', with: 1950
    choose 'customer_is_veteran'
  
    click_on 'Create Customer'

    expect(current_path).to eq("/customers")
    save_and_open_page
    expect(page).to have_content(customer_1.name)
  end
end