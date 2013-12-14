class AddInvoiceFrequencyIDtoSales < ActiveRecord::Migration
  def up
    add_column :sales, :invoice_frequency_id, :integer

    populate_invoice_frequency

    link_invoice_frequency
  end

  def down
    remove_column :sales, :invoice_frequency_id

    InvoiceFrequency.delete_all
  end

  def populate_invoice_frequency
    Sale.all.each do |sale|
      InvoiceFrequency.find_or_create_by(frequency: sale.invoice_frequency) do |ivf|
        ivf.frequency = sale.invoice_frequency
      end
    end
  end

  def link_invoice_frequency
    Sale.all.each do |sale|
      freq = InvoiceFrequency.find_by(frequency: sale.invoice_frequency)
      sale.update_attribute(:invoice_frequency_id, freq.id)
    end
  end
end
