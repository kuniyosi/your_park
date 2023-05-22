class Customers::SessionsController < Devise::SessionsController

  def guest_sign_in
    customer = Customer.guest
    sign_in customer
    flash[:notice] = "ゲストとしてログインしました"
    redirect_to customer_path(customer)
  end

end