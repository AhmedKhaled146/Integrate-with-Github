require "test_helper"

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  # case_1
  it "is valid with valid attributes" do
    user = User.new(email: "testuser@example.com", password: "password", password_confirmation: "password")
    expect(user).to be_valid
  end

  # case_2
  it "is not valid with an invalid email" do
    user = User.new(email: "invalid_email", password: "password", password_confirmation: "password")
    expect(user).to_not be_valid
  end

  # case_3
  it "is not valid without a pass. and pass. confirmation" do
    user = User.new(email: "testuser@example.com", password: nil, password_confirmation: nil)
    expect(user).to_not be_valid
  end
end
