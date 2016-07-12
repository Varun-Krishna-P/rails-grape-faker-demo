class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :name
      t.string :address
      t.integer :age
      t.string :city
      t.decimal :salary, precision: 5, scale: 2
      t.date :date_of_birth
      t.string :country

      t.timestamps null: false
    end
  end
end
