class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :index]
  before_action :move_to_index, only: [:only]

  def index
    @item = Item.find(params[:item_id])
    if @item.order.present?
      redirect_to root_path
    else
      @order_address = OrderAddress.new
    end
  end

  def new
  end

  def create
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:postal_code, :area_id, :city, :house_number, :building_name, :phone).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
    # item_idとuser_idを取得してフォームオブジェクトで扱えるように。pictweetAAAAAのコメントコントローラーが参考になる。
  end

  def pay_item
    Payjp.api_key = 'sk_test_c01d85574b7f876f58a7c8b8' # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: @item.price, # 商品の値段
      card: order_params[:token], # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

  def move_to_index
    redirect_to root_path if current_user == @item.user
  end
end
