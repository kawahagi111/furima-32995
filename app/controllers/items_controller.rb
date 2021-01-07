class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit]
  before_action :move_to_index, except: [:index, :new, :show]
  before_action :set_item, only: [:show, :edit, :update]
  def index
    @items = Item.order('created_at DESC')
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def new
    @item = Item.new
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :item_name, :explanation, :category_id, :condition_id, :charge_id, :area_id, :day_id,
                                 :price).merge(user_id: current_user.id)
  end

  def move_to_index
    @item = Item.find(params[:id])
      unless @item.user_id == current_user.id
        redirect_to action: :index
      end
  end

  def set_item
  @item = Item.find(params[:id])
  end
end
