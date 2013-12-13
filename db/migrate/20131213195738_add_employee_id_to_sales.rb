class AddEmployeeIdToSales < ActiveRecord::Migration
  def up
    add_column :sales, :employee_id, :integer

    populate_employee

    link_employee

  end

  def down
    remove_column :sales, :employee_id

    Employee.delete_all
  end


  def populate_employee
    Sale.all.each do |sale|
      Employee.find_or_create_by(name: sale.employee) do |empl|
        empl.name = sale.employee
      end
    end
  end

  def link_employee
    Sale.all.each do |sale|
      employee = Employee.find_by(name: sale.employee)
      sale.update_attribute(:employee_id, employee.id)
    end
  end
end

