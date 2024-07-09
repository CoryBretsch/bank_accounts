require 'rails_helper'

RSpec.describe 'the customer show page' do 
  it 'displays customer name with all attributes' do 
    customer = Customer.create!(name: "Leah Stromboli", birth_year: 1990, is_veteran: true)
    checking = customer.accounts.create!(account_type: "Checking", balance: 24, has_veteran_status: false)
    savings = customer.accounts.create!(account_type: "Savings", balance: 80, has_veteran_status: false)
    visit "/customers/#{customer.id}"

    expect(page).to have_content(customer.name)
    expect(page).to have_content(customer.birth_year)
    expect(page).to have_content(customer.is_veteran)
    expect(page).to have_content(2)
  end

  describe 'parent child index link' do 
    it 'links to child index from parent show page' do  
      customer = Customer.create!(name: "Leah Stromboli", birth_year: 1990, is_veteran: true)
      checking = customer.accounts.create!(account_type: "Checking", balance: 24, has_veteran_status: false)
      savings = customer.accounts.create!(account_type: "Savings", balance: 80, has_veteran_status: false)
      visit "/customers/#{customer.id}"

      click_link "/#{customer.name}'s Accounts"

      expect(current_path).to eq("/customers/#{customer.id}/accounts")
    end
  end

  describe 'update a customer' do 
    it 'updates a customer record' do  
      customer = Customer.create!(name: "Leah Strombolii", birth_year: 1991, is_veteran: true)
      
      visit "/customers/#{customer.id}"

      click_on "Update Customer"

      expect(current_path).to eq("/customers/#{customer.id}/edit")

      fill_in "Name", with: "Leah Stromboli"
      fill_in 'Birth year', with: 1990
      choose 'customer_is_veteran'
      click_on "Update Customer"

      expect(current_path).to eq("/customers/#{customer.id}")
      expect(page).to have_content("Leah Stromboli")
    end
  end
end

