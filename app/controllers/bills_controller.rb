class BillsController < ApplicationController
  before_action :load_bill, except: %i(index new create edit)
  before_action :load_room

  def index; end

  def new
    @bill = Bill.new
  end

  def create
    @bill = Bill.new bill_params
    if @bill.save
      flash[:success] = t "success"
      redirect_to room_bill_path(@room.id, @bill)
    else
      flash[:danger] = t "error"
      redirect_to bill_path(@bill.room_id)
    end
  end
  
  def show; end

  private
  def bill_params
    params.require(:bill).permit Bill::BILL_PARAMS
  end

  def load_room
    @room = Room.find_by id: params[:room_id]
    return if @room
    flash[:danger] = t "not_exist"
    redirect_to root_path
  end

  def load_bill
    @bill = Bill.find_by id: params[:id]
    return if @bill
    flash[:danger] = t "error"
    redirect_to root_path
  end
end
