require 'pry'
class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get '/patients' do
   patients =  Patient.all
    patients.to_json
  end

  post '/patients' do 
    binding.pry
    patient = Patient.create(
      name: params[:name],
      dob: params[:dob],
      dos: params[:dos],
      days_to_be_seen: params[:days_to_be_seen],
      weeks_to_be_seen: params[:weeks_to_be_seen],
      months_to_be_seen: params[:months_to_be_seen],
      xray_type: params[:xray_type],
      us_type: params[:us_type],
      enfd: params[:enfd],
      segm: params[:segm],
      note: params[:note],
      doctor_id: params[:doctor_id]
    )
   
    patient.to_json
  
  end

end
