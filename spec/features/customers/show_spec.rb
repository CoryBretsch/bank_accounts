require 'rails_helper'

RSpec.describe 'the customer show page' do 
  it 'displays customer name with all attributes' do 
    customer = Customer.create!(name: "Leah Stromboli", birth_year: 1990, is_veteran: true)

    visit "/customers/#{customer.id}"
    expect(page).to have_content(customer.name)
    expect(page).to have_content(customer.birth_year)
    expect(page).to have_content(customer.is_veteran)
  end


end

