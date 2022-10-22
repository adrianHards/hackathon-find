require "uri"
require "json"
require "net/http"

class PatientsController < ApplicationController

  skip_before_action :verify_authenticity_token
# skip_before_action :authenticate_user!, only: [:upload, :confirmation]

  def upload
    match(cloudinary)
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

  def match(cloudinary)
    @patients = Patient.all
    patient_array = []

    for patient in @patients
      patient_array << "https://res.cloudinary.com/detwvcqim/image/upload/production/#{patient.photo}.jpg"
    end

    url = URI("https://zylalabs.com/api/30/face+comparison+validator+api/94/compare+image+with+image+url")

    https = Net::HTTP.new(url.host, url.port)
    https.use_ssl = true

    request = Net::HTTP::Post.new(url)
    request["Authorization"] = "Bearer 200|5wXskwfYR8LdkrP3Qmr3guSuZvYZmobzNcqoc3oN"
    request["Content-Type"] = "application/json"
    request.body = JSON.dump({
      "linkFile1": cloudinary,
      "linkFile2": "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ad/Angelina_Jolie_2_June_2014_%28cropped%29.jpg/640px-Angelina_Jolie_2_June_2014_%28cropped%29.jpg"
    })

    response = https.request(request)
    puts response.read_body
  end

  def patient_params
    params.require(:patient).permit(:name, :phone_numbers, :location, :details, :photo)
  end

end
