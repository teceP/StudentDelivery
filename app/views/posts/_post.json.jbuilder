# frozen_string_literal: true

json.extract! post, :id, :cart_id, :buyer, :seller, :created_at, :updated_at
json.url post_url(post, format: :json)
