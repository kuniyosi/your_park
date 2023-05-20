class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin_admin!

  def index
    @customers = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
    @parks = @customer.parks

    favorites = Favorite.where(customer_id: @customer.id).pluck(:park_id)
    @favorite_list = Park.find(favorites)
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    redirect_to admin_customer_path(@customer.id)
  end

  def destroy
    @customer = Customer.find(params[:id])
    @customer.destroy
    redirect_to admin_customers_path
  end

 private

  def customer_params
    params.require(:customer).permit(:name, :introduction, :profile_image)
  end

end
