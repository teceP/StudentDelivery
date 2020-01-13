require "rails_helper"

RSpec.describe RoomChannel, type: :channel do
  before do
    @user = create(:user)
    Devise::Controllers::SignInOut.sign_in @user
    stub_connection current_user: current_user
  end

  it "subscribe to a stream" do
    subscribe
    expect(subscription).to be_success
  end

end
