class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :index]
  before_action :move_to_index, only: [:only]
  before_action :find, only: [:index, :create]

  def index
    if @item.order.present?
      redirect_to root_path
    else
      @order_address = OrderAddress.new
    end
  end

  def create
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
    Payjp.api_key = ENV['PAYJP_SECRET_KEY'] # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: @item.price, # 商品の値段
      card: order_params[:token], # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

  def move_to_index
    redirect_to root_path if current_user == @item.user
  end

  def find
    @item = Item.find(params[:item_id])
  end
end
