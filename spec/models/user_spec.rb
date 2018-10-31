require 'spec_helper'

RSpec.describe User, type: :model do
#  pending "add some examples to (or delete) #{__FILE__}"
  describe "User authenticate method" do

    before(:all) do
      @user = User.create(first_name: "cody", last_name: "skillcode", email: "coder@skillcrush", password: "password")
#     @valid_user_hash = {email: @user.email, password: @user.password}
  end

  after(:all) do
    if !@user.destroyed?
      @user.destroy
    end
  end

  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password) }

  it 'authenticates and returns a user when valid email and password passed in' do
    authenticate_user = User.authenticate(@user.email, @user.password)
    expect(authenticate_user).to eql(@user)
#    post :authenticate, @valid_user_hash
#    expect(User.find_by_email_and_password("coder@skillcrush.com",     "password").present?).to be (true)
    end
  end
end
