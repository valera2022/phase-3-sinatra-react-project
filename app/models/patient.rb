class Patient < ActiveRecord::Base
    belongs_to :doctor
    def destroy_all 
          Patient.destroy_all
    end

end

# Patient.destroy_all
