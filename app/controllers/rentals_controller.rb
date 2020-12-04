class RentalsController < ApplicationController

  def new
    @rental = Rental.new
  end

  def create
    @rental = Rental.new(rental_params)
    @rental.update(loan_datetime: DateTime.current)
    device_id = @rental.device_id
    @devices = Device.find(device_id)
    if @devices.lending_status == true
      flash.now[:alert]= '入力された機器IDは貸出されているので登録できません'
      render :new
    else
      @device = @devices.update(lending_status: 1)
      if @rental.save
        redirect_to root_path
      else
        render :new
      end
    end
  end

  def return
  end

  def show
  end


private
def rental_params
  params.require(:rental).permit(:device_id, :rental_staff, :department_id)
end
end