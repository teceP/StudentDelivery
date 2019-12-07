# frozen_string_literal: true

module ApplicationHelper

  def user_avatar(user, size)
    if user.avatar.attached?
      user.avatar.variant(resize_to_fit: "#{size}x#{size}!")
    else
      #use here default from gravatar
      gravatar_image_url(user.email, size: size)
    end
  end

end
