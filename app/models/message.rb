# frozen_string_literal: true

class Message < ApplicationRecord
  has_one :user
end
