class AddCustomerAndAccountNoIdToSales < ActiveRecord::Migration
  def up
    add_column :sales, :customer_and_account_no_id, :integer

    populate_customer_and_account_no

    link_customer_and_account_no
  end

  def down
    remove_column :sales, :customer_and_account_no_id
  end

  def populate_customer_and_account_no
    Sale.all.each do |sale|
      CustomerAndAccountNo.find_or_create_by(name: sale.customer_and_account_no) do |caa|
        caa.name = sale.customer_and_account_no
      end
    end
  end

  def link_customer_and_account_no
    Sale.all.each do |sale|
      caa = CustomerAndAccountNo.find_by(name: sale.customer_and_account_no)
      sale.update_attribute(:customer_and_account_no_id, caa.id)
    end
  end


end
