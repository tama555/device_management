class DevicesController < ApplicationController

  def index
  end

  def new
    @device = Device.new
  end

  def create
    @device = Device.new(device_params)
      
      if @device.save
        redirect_to @device
      else
        render :new
      end
  end


end
