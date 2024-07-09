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
  end
end 
