class PatientsController < ApplicationController
  def patients_params
    params.require(:patient).permit(:first_name, :last_name, :phone_numbers [], :location, :details, :photo)
  end
end
