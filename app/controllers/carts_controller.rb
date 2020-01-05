# frozen_string_literal: true

class CartsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_cart
  before_action :set_cart, only: [:show, :edit, :update, :destroy]
  before_action :require_user, only: [:index]
  # GET /carts
  # GET /carts.json
  def index
      if current_user.admin?
        @cart = Cart.all
      else
        redirect_to root_path, notice: "No permission to see all carts"
    end
  end


  # GET /carts/1
  # GET /carts/1.json
  def show
    # When trying to look into others shopping cart
    if @cart.id != session[:cart_id]
      redirect_to root_path, notice: "This is not your Shopping Cart"
    end
  end

  # GET /carts/new
  def new
    redirect_to root_path
  end

  # GET /carts/1/edit
  def edit
    redirect_to root_path
  end

  # POST /carts
  # POST /carts.json
  def create
    @cart = Cart.new(cart_params)

    respond_to do |format|
      if @cart.save
        format.html { redirect_to @cart, notice: "Cart was successfully created." }
        format.json { render :show, status: :created, location: @cart }
      else
        format.html { render :new }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /carts/1
  # PATCH/PUT /carts/1.json
  def update
    respond_to do |format|
      if @cart.update(cart_params)
        format.html { redirect_to @cart, notice: "Cart was successfully updated." }
        format.json { render :show, status: :ok, location: @cart }
      else
        format.html { render :edit }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /carts/1
  # DELETE /carts/1.json
  def destroy
    @cart.destroy if @cart.id == session[:cart_id]
    session[:cart_id] = nil
    respond_to do |format|
      format.html { redirect_to root_path, notice: "Cart was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart
      @cart = Cart.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cart_params
      params.fetch(:cart, {})
    end

    def invalid_cart
      logger.error("Attempt to access invalid cart #{params[:id]}")
      redirect_to root_path, notice: "That cart doesn't exist"
    end
end