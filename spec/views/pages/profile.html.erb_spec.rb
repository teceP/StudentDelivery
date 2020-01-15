require 'rails_helper'
require 'spec_helper'

RSpec.describe "pages/profile", type: :view do

  before do
    @user1 = create(:user)
    sign_in @user1
  end

  it "should display email" do
    render
    expect(rendered).to match("my@email.com")
  end

  it "should display bio" do
    render
    expect(rendered).to match("mybio")
  end

  it "should display username" do
    render
    expect(rendered).to match("myusername")
  end

  it "should display subject" do
    render
    expect(rendered).to match("ai")
  end

  it "shouldnt display password" do
    render
    expect(rendered).to_not match("mypassword")
  end

end
