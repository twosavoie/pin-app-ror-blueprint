require 'spec_helper'

describe User do
  pending "add some examples to (or delete) #{__FILE__}"

  before(:all) do
    @user = User.create(email: "coder@skillcrush", password: "password")
    @valid_user_hash = {email: @user.email, password: @user.password}
  end

  after(:all) do
    if !@user.destroyed?
      @user.destroy
    end
  end

  it 'authenticates and returns a user when valid email and password passed in' do
    post :authenticate, @valid_user_hash
    expect(User.find_by_email_and_password("coder@skillcrush.com", "password").present?).to be (true)
  end
end
