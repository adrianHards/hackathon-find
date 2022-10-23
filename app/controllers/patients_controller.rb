require "uri"
require "json"
require "net/http"

class PatientsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_patient, only: %i[create edit show update destroy]

  def upload
  end

  def verified
  end

  def index
    @patients_matched = Patient.all.select { :name.present? }
  end

  # def create
  #   @patient = Patient.new(patient_params)
  #   if @patient.save
  #     render json: @patient.as_json, status: :created
  #   else
  #     render json: @patient.errors, status: :unprocessable_entity
  #   end
  # end

  def show
  end

  def edit
  end

  def update
  @patient.update(patient_params)
  redirect_to patients_path
  # @patient.name = params[:id]
  # @patient.phone_numbers = params[:phone_numbers]
  # @patient.location = params[:location]
  # @patient.details = params[:details]
  # redirect_to patient_path(@patient)
  end

  def destroy
    @patient.destroy
    redirect_to patients_path, status: :see_other
  end

  def cloudinary
    name = params[:results][:name]
    session[:name] = name
    phone_number = params[:results][:phoneNumber]
    session[:phone_number] = phone_number
    url = params[:results][:url]
    session[:url] = url
  end

  def confirmation
    user_photo = session[:url]
    user_name = session[:name]
    user_phone_number = session[:phone_number]
    @patients = Patient.all
    @patient_array = []
    @match = nil

    for patient in @patients
      @patient_array << [["https://res.cloudinary.com/detwvcqim/image/upload/development/#{patient.photo.key}.jpg"], patient.location, patient.phone_numbers]
    end

    # url = URI("https://zylalabs.com/api/30/face+comparison+validator+api/94/compare+image+with+image+url")

    # https = Net::HTTP.new(url.host, url.port)
    # https.use_ssl = true

    # request = Net::HTTP::Post.new(url)
    # request["Authorization"] = ENV['ZYLA']
    # request["Content-Type"] = "application/json"

    @patient_array.each do | patient |
    #   request.body = JSON.dump({

    #     "linkFile1": user_photo.to_s,
    #     "linkFile2": patient[0].join.to_s

    #   })

    #   response = https.request(request)
    #   @data = JSON.parse(response.read_body)

    #   if @data["data"]["similarPercent"] > 0.75
    #     @match = patient[1]
    #   end
    # end

    # response = https.request(request)
    # @data = JSON.parse(response.read_body)

      if 1 > 0.75
        pat = Patient.find_by(location: patient[1])
        @match = patient
        pat.name.push(session[:name])
        pat.details = (session[:phone_number])
        pat.save!
      end
    end

  end

  private

  def set_patient
    @patient = Patient.find(params[:id])
  end

  def patient_params
    params.require(:patient).permit(:name, :phone_numbers, :location, :details, :photo)
  end
end
