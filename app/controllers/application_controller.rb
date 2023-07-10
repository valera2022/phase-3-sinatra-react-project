
class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'

  
  # Add your routes here
  # kill service 
  # lsof -i :9292
  # kill process number
  # ~~~~~~~~~~~
  # getting patients throught get doctors
  # get '/patients' do
  #  patients =  Patient.all
  #   patients.to_json
  # end

  post '/patients' do 
    doctor = Doctor.find_by(id: params[:doctor_id] )
    patient = doctor.patients.create(
      name: params[:name],
      dob: params[:dob],
      dos: params[:dos],
      ins: params[:ins],
      days_to_be_seen: params[:days_to_be_seen],
      weeks_to_be_seen: params[:weeks_to_be_seen],
      months_to_be_seen: params[:months_to_be_seen],
      xray_type: params[:xray_type],
      us_type: params[:us_type],
      enfd: params[:enfd],
      segm: params[:segm],
      note: params[:note]
      
    )
 

    # note on post: you may not need to declare keys, simply create(params)
   
    patient.to_json
  
  end


  patch'/patients/:id'  do 
    patient = Patient.find(params[:id])
   
    patient.update(
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

   delete '/patients/:id' do 
    patient = Patient.find_by(id: params[:id])
    patient.destroy
    
  
  end

  # doctor controller
  get '/doctors' do 
    doctors = Doctor.all
    doctors.to_json(include: :patients)
  
  end

  post '/doctors' do 
    doctor = Doctor.create(params)
  
      doctor.to_json(include: :patients)
   
  
  
  end

  patch '/doctors/:id' do 
    doctor = Doctor.find(params[:id])
   
    doctor.update(
      name: params[:name],
      specialty: params[:specialty]
      
      
    )
    doctor.to_json(include: :patients)
  
  end

  delete '/doctors/:id' do 
    doctor = Doctor.find(params[:id])

    doctor.destroy()

    # doctor.json()
  
  end
  #  post '/doctors/:doctor_id/patients' do
  #   # find the specific doctor 
  #    doctor = Owner.find_by(id: params[:doctor_id]) 
  #   #  create patients into the specified doctor
  #    patient = Owner.dogs.create(params)
  # end

  
end
