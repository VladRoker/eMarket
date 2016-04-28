class CouponsController < ApplicationController
  before_action :authorize

  def index
    @coupons = current_user.coupons
  end

  def show
    @coupon = Coupon.find params[:id]
    unless @coupon.user == current_user
      redirect_to coupons_path
    end
  end

  def new
    @coupon = Coupon.new
  end

  def create
    @coupon = Coupon.find_by_code params[:coupon][:code]
    if !(@coupon.nil?) && @coupon.user.nil?
        @coupon.user = current_user
        @coupon.save!
        redirect_to coupon_path(@coupon.id)
        return
    end
    redirect_to new_coupon_path
  end

  def destroy
    @coupon = Coupon.unscoped.find params[:id]
    if @coupon.user.id == current_user.id
      @coupon.used_flag = true
      @coupon.save!
    end
    redirect_to coupons_path
  end
end
