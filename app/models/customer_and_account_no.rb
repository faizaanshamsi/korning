class CustomerAndAccountNo < ActiveRecord::Base
  has_many :sales

  def display_invoice_frequency
    freq = []
    self.sales.each do |sale|
      freq << sale.invoice_frequency.frequency unless freq.include?(sale.invoice_frequency.frequency)
    end
    freq.join(', ')
  end
end
