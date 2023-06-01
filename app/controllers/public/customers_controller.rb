class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!
  before_action :ensure_guest_customer, only: [:edit]

  def show
    @customer = Customer.find(params[:id])
    @parks = @customer.parks

    favorites = Favorite.where(customer_id: @customer).pluck(:park_id)
    @favorites_list = Park.find(favorites)
    @favorites_list = Kaminari.paginate_array(@favorites_list).page(params[:page]).per(5)
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
       flash[:notice] = "編集に成功しました"
       redirect_to customer_path(@customer)
    else
       flash[:notice] = "編集に失敗しました"
       render :edit
    end
  end

  def destroy
    @customer = Customer.find(params[:id])
    if @customer.destroy
       flash[:notice] = "退会が完了しました"
       redirect_to :root
    else
       flash[:notice] = "退会に失敗しました"
       render customer_path(@customer)
    end
  end

 private

  def customer_params
    params.require(:customer).permit(:name, :introduction, :profile_image)
  end

  def ensure_guest_customer
    @customer = Customer.find(params[:id])
    if @customer.name == "guest"
       flash[:notice] = "ログインに成功しました"
       redirect_to customer_path(current_customer)
    end
  end

end
