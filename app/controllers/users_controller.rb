# frozen_string_literal: true

class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def profile
  end

  def index
    @users = User.all
  end
end
