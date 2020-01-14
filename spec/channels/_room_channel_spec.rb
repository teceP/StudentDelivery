# frozen_string_literal: true

require "rails_helper"

RSpec.describe RoomChannel, type: :channel do
  before do
    @action_cable = ActionCable.server
    @user = create(:user)
    sign_in @user
    stub_connection current_user: @user
    subscribe
  end

  it "subscribe to a stream with wrong streamname" do
    expect(subscription).to be_confirmed
  end

  it "subscribe to a stream, check stream name" do
    expect(subscription).to be_confirmed
    expect(subscription).to have_stream_from("room_channel")
  end

  it "perform leave: stopping streams, no streams left" do
    expect(subscription).to have_stream_from("room_channel")
    subscription.unsubscribe_from_channel
    expect(subscription).not_to have_streams
  end
end
