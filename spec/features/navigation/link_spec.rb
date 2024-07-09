require 'rails_helper'

RSpec.describe 'navigation links' do 
  describe 'child index link' do
    it 'links to the child index page from /customers' do
      visit '/customers'

      click_link 'All Bank Accounts'

      expect(current_path).to eq('/accounts')
    end

    it 'links to the child index page from /accounts' do
      visit '/accounts'

      click_link 'All Bank Accounts'

      expect(current_path).to eq('/accounts')
    end

  describe 'parent index link' do 
    it 'links to the parent index page from /customers' do 
      visit '/customers'

      click_link 'All Customers'

      expect(current_path).to eq('/customers')
    end

    it 'links to the child index page from /accounts' do
      visit '/accounts'

      click_link 'All Customers'

      expect(current_path).to eq('/customers')
    end
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
  end 
end