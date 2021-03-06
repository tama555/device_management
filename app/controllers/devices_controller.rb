class DevicesController < ApplicationController

  def index
    @devices = Device.all
  end

  def new
    @device = Device.new
  end

  def create
    @device = Device.new(device_params)
      
      if @device.save
        redirect_to root_path
      else
        render :new
      end
  end

  def edit
    @device = Device.find(params[:id])
  end

  def update
    @device = Device.find(params[:id])
    @device.update(device_params)
    redirect_to @device
  end

  def destroy
    device = Device.find(params[:id])
    device.destroy
    redirect_to root_path
  end

  def show
    @device = Device.find(params[:id])
    @tasks = Task.includes(:user).order("created_at DESC").where(device_id: params[:id])
  end

  def list
    # @devices = Device.order("created_at DESC")
    @devices = Device.all 
  end



  


private
  def device_params
    params.require(:device).permit(:device_class_id, :name, :model_number, :serial_number, :purchase_date, :price, :last_inspection_date, :next_inspection_date, :inspection_interval_id)
  end

end


