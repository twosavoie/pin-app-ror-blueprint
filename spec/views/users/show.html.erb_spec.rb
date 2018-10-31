require 'spec_helper'

RSpec.describe "users/show", type: :view do
  before(:each) do
    @user = FactoryGirl.create(:user)
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(@user.first_name)
    rendered.should match(@user.last_name)
    rendered.should match(@user.email)
  end
end
