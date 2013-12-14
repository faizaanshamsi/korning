class Sale < ActiveRecord::Base
  belongs_to :employee
  belongs_to :customer_and_account_no
  belongs_to :product_name
  belongs_to :invoice_frequency

  def self.month_sales(num)
    Sale.where("sale_date >= ?", num.months.ago)
  end

  def price_per_unit
    (sale_amount / units_sold).round(2)
  end
end
