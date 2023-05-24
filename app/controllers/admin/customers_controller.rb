class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin_admin!

  def index
    @customers = Customer.page(params[:page])
  end

  def show
    @customer = Customer.find(params[:id])
    @parks = @customer.parks.page(params[:page])

    favorites = Favorite.where(customer_id: @customer.id).pluck(:park_id)
    @favorites_list = Park.find(favorites)
    @favorites_list = Kaminari.paginate_array(@favorites_list).page(params[:page]).per(5)
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      flash[:notice] = "編集に成功しました"
       redirect_to admin_customer_path(@customer.id)
    else
       flash[:notice] = "編集に失敗しました"
       render :edit
    end
  end

  def destroy
    @customer = Customer.find(params[:id])
    if @customer.destroy
       flash[:notice] = "会員の削除に成功しました"
       redirect_to admin_customers_path
    else
       flash[:notice] = "会員の削除に失敗しました"
       render admin_customer_path(@customer.id)
    end
  end

 private

  def customer_params
    params.require(:customer).permit(:name, :introduction, :profile_image)
  end

end
