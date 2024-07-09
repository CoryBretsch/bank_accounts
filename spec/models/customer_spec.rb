require "rails_helper"

RSpec.describe Customer, type: :model do 
  describe "reference" do 
    it {should have_many :accounts}
  end

end