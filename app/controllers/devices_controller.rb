class DevicesController < ApplicationController

  def index
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



private
  def device_params
    params.require(:device).permit(:device_class_id, :name, :model_number, :serial_number, :purchase_date, :price, :last_inspection_date, :next_inspection_date, :inspection_interval_id)
  end

end


