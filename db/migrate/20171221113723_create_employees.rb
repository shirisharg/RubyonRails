class CreateEmployees < ActiveRecord::Migration[5.1]
  def change
    create_table :employees do |t|
      t.string :name
      t.references :project
      t.references :employee
      t.timestamps
    end
  end
end
