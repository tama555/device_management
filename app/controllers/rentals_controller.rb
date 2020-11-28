class RentalsController < ApplicationController

  def new
    @rental = Rental.new
  end

  def create
    @rental = Rental.new(rental_params)
    @rental.update(loan_datetime: DateTime.current)
    @device = Device.update(lending_status: 0)
    if @rental.save
      redirect_to root_path
    else
      render :new
    end
  end


private
def rental_params
  params.require(:rental).permit(:device_id, :rental_staff, :department_id)
end
end