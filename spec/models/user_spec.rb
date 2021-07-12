require 'rails_helper'
RSpec.describe User, type: :model do
  context "With valid attributes" do 
    it "should save" do 
      user = User.new(
        first_name: 'Cesar',
        last_name: 'Francisco',
        email: 'princexcesar@gmail.com'
      )
      expect(user).to be_valid
    end
  end
  context "With invalid attributes" do 
    it "should not save if first_name field is blank" do
        user = User.new(
            first_name: "", 
            last_name: 'Francisco', 
            email: 'princexcesar@gmail.com')
      expect(user).to be_invalid
    end
    it "should not save if last_name field is blank" do
      user = User.new(
            first_name: "Cesar",
            last_name: "",
            email: "princexcesar@gmail.com"
      )
    end
    it "should not save if email already exists" do
      
      expect(user).to be_valid
      user = User.new(
        first_name: "Cesar",
        last_name: "Francisco",
        email: "princexcesar@gmail.com"
      )
      expect(user).to be_invalid
      # user1 = User.new(
      #   first_name: "Hello",
      #   last_name: "World",
      #   email: "hello@gmail.com"
      # )
    end
    it "should contain a valid email" do
      user = User.new(
        first_name: "Cesar",
        last_name: "Francisco",
        email: "princexcesargmailcom"
      )
      expect(user).to be_invalid
    end
  end
end