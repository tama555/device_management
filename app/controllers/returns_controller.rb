class ReturnsController < ApplicationController
  def new
    @return = Return.new
  end

  def create
    @return = Return.new(return_params)
    device_id = @return.device_id
    if Device.find_by(id: device_id)
      @devices = Device.find(device_id)

      if @devices.lending_status == false
        flash.now[:alert]= '入力された機器IDは返却されているので登録できません'
        render :new
      else
        @return.update(return_datetime: DateTime.current)
        @device = @devices.update(lending_status: 0)

        if @return.save
          redirect_to root_path
        else
          render :new
        end
      end

    else
      flash.now[:alert]= '入力された機器IDは存在しません'
      render :new
    end




    # device_id = @rental.device_id
    # if Device.find_by(id: device_id)
    #   @devices = Device.find(device_id)
    #   if @devices.lending_status == true
    #     flash.now[:alert]= '入力された機器IDは貸出されているので登録できません'
    #     render :new
    #   else
    #     @rental.update(loan_datetime: DateTime.current)
    #     @device = @devices.update(lending_status: 1)
    #     if @rental.save
    #       redirect_to root_path
    #     else
    #       render :new
    #     end
    #   end

    # else
    #   flash.now[:alert]= '入力された機器IDは存在しません'
    #   render :new
    # end
    
  end

  private
  def return_params
    params.require(:return).permit(:device_id, :return_staff, :department_id)
  end
end
