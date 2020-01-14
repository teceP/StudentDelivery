# frozen_string_literal: true

class ChatController < ApplicationController
  def index
    @message = Message.new
  end
end
