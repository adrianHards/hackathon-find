class PatientsController < ApplicationController

  skip_before_action :verify_authenticity_token
# skip_before_action :authenticate_user!, only: [:upload, :confirmation]


  def upload
  end

  def confirmation
  end

  def index
  end

  def show
  end
  
  def create
    @patient = Patient.new(patient_params)
    if @patient.save
      render json: @patient.as_json, status: :created
    else
      render json: @patient.errors, status: :unprocessable_entity
    end
  end

  private

  def patient_params
    params.require(:patient).permit(:first_name, :last_name, :phone_numbers, :location, :details)

end
