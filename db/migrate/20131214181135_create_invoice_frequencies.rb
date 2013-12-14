class CreateInvoiceFrequencies < ActiveRecord::Migration
  def change
    create_table :invoice_frequencies do |t|
      t.string :frequency

      t.timestamps
    end
  end
end
