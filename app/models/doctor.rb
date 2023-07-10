class Doctor < ActiveRecord::Base 
    has_many :patients
    def destroy_all 
        Doctor.destroy_all
  end

end
# lower case file
# Doctor.destroy_all