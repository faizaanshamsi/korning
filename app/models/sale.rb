class Sale < ActiveRecord::Base
  belongs_to :employee
  belongs_to :customer_and_account_no
end
