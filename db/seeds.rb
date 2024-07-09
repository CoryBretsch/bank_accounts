# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


Account.destroy_all
Customer.destroy_all

banana = Customer.create!(name: "Banana Bunch", birth_year: 2024, is_veteran: true)
leah = Customer.create!(name: "Leah Stromboli", birth_year: 1990, is_veteran: true)
millie = Customer.create!(name: "Millie Banana", birth_year: 2000, is_veteran: false)


leah.accounts.create!(account_type: "Checking", balance: 24, has_veteran_status: false)
leah.accounts.create!(account_type: "Savings", balance: 80, has_veteran_status: false)

millie.accounts.create!(account_type: "Checking", balance: 40, has_veteran_status: true)
millie.accounts.create!(account_type: "Savings", balance: 600, has_veteran_status: true)