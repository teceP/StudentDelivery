# frozen_string_literal: true

class MessagesController < ApplicationController
  include Devise::Controllers::Helpers

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(msg_params)
    @message.user_email = current_user.email

    if @message.save
      ActionCable.server.broadcast "room_channel",
                                   content: @message.user_email + ": " + @message.content
    end
  end

  private
    def msg_params
      params.require(:message).permit(:content)
    end
end
