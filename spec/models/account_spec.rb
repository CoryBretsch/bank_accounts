require "rails_helper"

RSpec.describe Account, type: :model do 
  describe "relationship" do 
    it {should belong_to :customer}
  end
end