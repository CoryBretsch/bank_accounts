require 'rails_helper'

RSpec.describe 'navigation links' do 
  describe 'child index link' do
    it 'links to the child index page from /customers' do
      visit '/customers'

      click_link 'All Bank Accounts'

      expect(current_path).to eq('/accounts')
    end

    it 'links to the child index page from /accounts' do
      visit '/customers'

      click_link 'All Bank Accounts'

      expect(current_path).to eq('/accounts')
    end

    describe '


end
end