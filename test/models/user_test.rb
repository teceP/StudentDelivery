# frozen_string_literal: true

require "test_helper"
class UserTest < ActiveSupport::TestCase
  # need for devise testing
  # factorybot-gem provides user for testing
  include Devise::Test::ControllerHelpers
  include FactoryBot::Syntax::Methods

  def setup
    @request.env["devise.mapping"] = Devise.mappings[:user]
    user = FactoryBot.create(:user)
    user.confirm! # or set a confirmed_at inside the factory. Only necessary if you are using the "confirmable" module
    sign_in user
  end

  test "user logs in: positive" do
    user.valid?
  end
end
