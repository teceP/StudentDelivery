# frozen_string_literal: true

module UsersHelper
  def user_avatar(user, size)
    if user.avatar.attached?
      user.avatar.variant(resize_to_fit: [size, size])
    else
      # use here default from gravatar
      gravatar_image_url(user.email, size: size)
    end
  end
end
