require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

    # has a password and a password_confirmation
    it "has has a password and a password_confirmation" do
      user = User.create(firstname: "abc", lastname:"def", email: "abc@gmail.com", password: "123456", password_confirmation: "123456")
      expect(user).to be_valid
    end

    # not valid if password and password_confirmation are different
    it "has matched password and password_confirmation" do
      user = User.create(firstname: "abc", lastname:"def", email: "abc@gmail.com", password: "123456", password_confirmation: "123456")
      expect(user.password).to eq(user.password_confirmation)
    end


    # emails must be unique (not case sensitive)
    it "has unique email which is not case sensitive" do
      user1 = User.create(firstname: "abc", lastname:"def", email: "ABC@gmail.com", password: "123456", password_confirmation: "123456")
      user2 = User.create(firstname: "abc", lastname:"def", email: "abc@gmail.com", password: "123456", password_confirmation: "123456")

      expect(user2).to_not be_valid
    end
    
    # has an email, a first name, and a last name
    it "has matched password and password_confirmation" do
      user = User.create(firstname: "abc", lastname:"def", email: "abc@gmail.com", password: "123456", password_confirmation: "123456")

      expect(user).to have_attributes(:firstname => "abc", :lastname => "def", :email => "abc@gmail.com")
    end

    it "has a minimum password length of 3" do
      user = User.create(firstname: "abc", lastname:"def", email: "abc@gmail.com", password: "12", password_confirmation: "12")
      expect(user).to_not be_valid
    end

  end

  describe '.authenticate_with_credentials' do
    # examples for this class method here
    it 'check if user input password match in database' do
      user = User.create(firstname: "abc", lastname:"def", email: "abc@gmail.com", password: "123456", password_confirmation: "123456")

      authenticate = User.authenticate_with_credentials(user.email, user.password)
      expect(authenticate).to eq (user)
    end

    it "is case insensitive for email" do
      user = User.create(firstname: "abc", lastname:"def", email: "abc@gmail.com", password: "123456", password_confirmation: "123456")

      test_email = "ABc@GMaiL.CoM"
      authenticate = User.authenticate_with_credentials(test_email, user.password)
      expect(authenticate).to eq (user)
    end

    it "will ignore spaces between email" do
      user = User.create(firstname: "abc", lastname:"def", email: "abc@gmail.com", password: "123456", password_confirmation: "123456")

      test_email = "  abc@gmail.com  "
      authenticate = User.authenticate_with_credentials(test_email, user.password)
      expect(authenticate).to eq (user)
    end


  end

end