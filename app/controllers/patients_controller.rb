class PatientsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    
  end

  def create
    @patient = Patient.new(patient_params)
    if @patient.save
      render json: @patient.as_json, status: :created
    else
      render json: @patient.errors, status: :unprocessable_entity
    end
  end

  def show
    
  
  end

  private

  def patient_params
    params.require(:patient).permit(:first_name, :last_name, :phone_numbers, :location, :details)
  end
end
