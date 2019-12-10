# frozen_string_literal: true

class User < ApplicationRecord
  before_save do
    email.downcase!
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable#, :database_authenticatable, :encryptable #Error:uninitialized constant Devise::Models::Encryptable
                                                                                             # Did you mean?  Devise::Encryptor

  has_one_attached :avatar

  def User.digist(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost

    # cost = strength of password encryption (optional)
    BCrypt::Password.create(string, cost: cost)
  end

end
