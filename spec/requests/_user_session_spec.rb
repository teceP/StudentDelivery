require 'rails_helper'

RSpec.describe "Sessions" do

  before(:all) do
    @user1 = create(:user)
  end

  it "login and get index" do
    sign_in @user1
    get root_url
    expect(response).to have_http_status(:success)
  end

  it "sign user in and out" do
    sign_in @user1
    get root_path
    expect(response).to render_template("pages/home")

    sign_out @user1
    get root_path
    expect(response).to render_template("pages/home")
  end
end
