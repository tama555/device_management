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

        rental_tasks = Rental.order(id: :DESC)
        return_tasks = Return.order(id: :DESC)
        rental_task = rental_tasks.find_by(device_id: device_id)
        return_task = return_tasks.find_by(device_id: device_id)

        history = RentHistory.new(rent_history_params)
        history.update(loan_datetime: rental_task.loan_datetime, return_datetime: return_task.return_datetime, device_id: rental_task.device_id, rental_staff: rental_task.rental_staff, return_staff: return_task.return_staff, rental_department_id: rental_task.department_id, return_department_id: return_task.department_id)
        history.update(day: return_task.return_datetime - rental_task.loan_datetime)
        
        history.save

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

  def rent_history_params
    params.permit(:loan_datetime, :return_datetime, :device_id, :rental_staff, :return_staff, :rental_department_id, :return_department_id, :day)
  end
end



