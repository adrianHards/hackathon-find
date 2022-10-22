class CreatePatients < ActiveRecord::Migration[7.0]
  def change
    create_table :patients do |t|
      t.string :name, array: true, default: []
      t.string :phone_numbers, array: true, default: []
      t.string :location
      t.text :details

      t.timestamps
    end
  end
end