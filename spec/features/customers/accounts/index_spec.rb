require 'rails_helper'

RSpec.describe 'the accounts show page' do 
  it 'displays customer name with all attributes' do 
    leah = Customer.create!(name: "Leah Stromboli", birth_year: 1990, is_veteran: true)
    checking = leah.accounts.create!(account_type: "Checking", balance: 24, has_veteran_status: true)
    savings = leah.accounts.create!(account_type: "Savings", balance: 80, has_veteran_status: false)

    visit "/customers/#{leah.id}/accounts"

    expect(page).to have_content(checking.account_type)
    expect(page).to have_content(checking.balance)
    expect(page).to have_content(checking.has_veteran_status)
    expect(page).to have_content(savings.account_type)
    expect(page).to have_content(savings.balance)
    expect(page).to have_content(savings.has_veteran_status)
  end
end