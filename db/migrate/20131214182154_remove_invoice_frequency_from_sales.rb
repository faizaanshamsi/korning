class RemoveInvoiceFrequencyFromSales < ActiveRecord::Migration
  def up
    remove_column :sales, :invoice_frequency
  end

  def down
    add_column :sales, :invoice_frequency, :string
  end
end
