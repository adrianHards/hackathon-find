require "uri"
require "json"
require "net/http"

class PatientsController < ApplicationController
  skip_before_action :verify_authenticity_token
# skip_before_action :authenticate_user!, only: [:upload, :confirmation]

  def upload

  end

  def send_cloudinary
    redirect_to confirmation_path(url: request.request_parameters[:key])
  end

  def confirmation
    user_photo = "https://res.cloudinary.com/detwvcqim/image/upload/v1666449758/development/v27sf24hlntxsl6xjczlygho7iay.jpg"
    @patients = Patient.all
    @patient_array = []
    @match = nil

    for patient in @patients
      @patient_array << [["https://res.cloudinary.com/detwvcqim/image/upload/development/#{patient.photo.key}.jpg"], patient.location]
    end

    url = URI("https://zylalabs.com/api/30/face+comparison+validator+api/94/compare+image+with+image+url")

    https = Net::HTTP.new(url.host, url.port)
    https.use_ssl = true

    request = Net::HTTP::Post.new(url)
    request["Authorization"] = "Bearer 203|ZbT5yHubmUCZVpqMMZwsNaos6hop7TA6GcEFTfaH"
    request["Content-Type"] = "application/json"

    @patient_array.each do | patient |
      request.body = JSON.dump({

        "linkFile1": user_photo.to_s,
        "linkFile2": patient[0].join.to_s

      })

      response = https.request(request)
      data = JSON.parse(response.read_body)

      if data["data"]["similarPercent"] > 0.75
        @match = patient[1]
      end
    end

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
    params.require(:patient).permit(:name, :phone_numbers, :location, :details, :photo)
  end
end
