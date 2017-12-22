class CreateEmployeesAndSkills < ActiveRecord::Migration[5.1]

  def change

	create_table :employees do |t|
      t.string :name
      t.references :project
      t.references :employee
      t.timestamps
    end

    create_table :skills do |t|
	  t.string :name
	  t.timestamps
  	end

  	create_table :employees_skills do |t|
  		t.belongs_to :employee
  		t.belongs_to :skill
  	end

  end

end
