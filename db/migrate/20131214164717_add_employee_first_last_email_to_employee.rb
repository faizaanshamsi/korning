class AddEmployeeFirstLastEmailToEmployee < ActiveRecord::Migration
  def up
    add_column :employees, :first_name, :string
    add_column :employees, :last_name, :string
    add_column :employees, :email, :string

    populate_first_last_email
  end

  def down
    remove_column :employees, :first_name
    remove_column :employees, :last_name
    remove_column :employees, :email
  end
  def populate_first_last_email
    Employee.all.each do |employee|
      temp = employee.name.split(' ')
      employee.update_attribute(:first_name, temp[0])
      employee.update_attribute(:last_name, temp[1])
      employee.update_attribute(:email, temp[2].gsub(/[()]/, ''))
    end
  end
end
