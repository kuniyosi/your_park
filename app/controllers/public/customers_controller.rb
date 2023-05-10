class Public::CustomersController < ApplicationController
  before_action :ensure_guest_customer, only: [:edit]

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to customer_path(@customer)
    else
      render :edit
    end
  end

 private

  def customer_params
    params.require(:customer).permit(:name, :introduction, :profile_image)
  end

  def ensure_guest_customer
    @customer = Customer.find(params[:id])
    if @customer.name == "guest"
      redirect_to customer_path(current_customer)
    end
  end

end
