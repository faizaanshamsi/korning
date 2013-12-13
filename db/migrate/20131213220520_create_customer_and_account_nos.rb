class CreateCustomerAndAccountNos < ActiveRecord::Migration
  def change
    create_table :customer_and_account_nos do |t|
      t.string :name

      t.timestamps
    end
  end
end
