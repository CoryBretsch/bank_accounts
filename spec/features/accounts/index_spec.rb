require 'rails_helper'

RSpec.describe 'the accounts index page' do 
  it 'displays all accounts and attributes' do 
    customer = Customer.create!(name: "Leah Stromboli", birth_year: 1990, is_veteran: true)
    account = customer.accounts.create!(account_type: "Checking", balance: 24, has_veteran_status: true)
    account_2 = customer.accounts.create!(account_type: "Savings", balance: 80, has_veteran_status: false)
    
    visit "/accounts"

    expect(page).to have_content(account.account_type)
    expect(page).to have_content(account.balance)
    expect(page).to have_content(account.has_veteran_status)
    expect(page).to have_content(account_2.account_type)
    expect(page).to have_content(account_2.balance)
    expect(page).to have_content(account_2.has_veteran_status)
  end

end