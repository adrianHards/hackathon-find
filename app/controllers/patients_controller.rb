require "uri"
require "json"
require "net/http"

class PatientsController < ApplicationController

  def upload
  end

  def confirmation(url)
    user_photo = url
    patients = Patient.all
    patient_array = []
    @match = nil

    for patient in @patients
      @patient_array << [["https://res.cloudinary.com/detwvcqim/image/upload/production/#{patient.photo.key}.jpg"], patient.location]
    end

    url = URI("https://zylalabs.com/api/30/face+comparison+validator+api/94/compare+image+with+image+url")

    https = Net::HTTP.new(url.host, url.port)
    https.use_ssl = true

    request = Net::HTTP::Post.new(url)
    request["Authorization"] = "Bearer 200|5wXskwfYR8LdkrP3Qmr3guSuZvYZmobzNcqoc3oN"
    request["Content-Type"] = "application/json"

    patient_array.each do | patient |

      request.body = JSON.dump({
        "linkFile1": user_photo,
        "linkFile2": patient[0]
      })

      response = https.request(request)

      if response['data']['similarPercent'] > 0.5
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
