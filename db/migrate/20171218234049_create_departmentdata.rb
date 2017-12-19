class CreateDepartmentdata < ActiveRecord::Migration[5.1]
  def change
    create_table :departmentdata do |t|
      t.string :description

      t.timestamps
    end
  end
end
