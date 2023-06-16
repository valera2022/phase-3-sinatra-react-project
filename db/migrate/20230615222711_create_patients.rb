class CreatePatients < ActiveRecord::Migration[6.1]
  def change
    create_table :patients do |t|
     t.string :name
     t.date :dob
     t.date :dos
     t.string :ins
     t.integer :days_to_be_seen
     t.integer :weeks_to_be_seen
     t.integer :months_to_be_seen
     t.string :xray_type
     t.string :us_type
     t.boolean :enfd
     t.boolean :segm
     t.text :note
     t.integer :doctor_id

    end
  end
end
