class AddCompanyAccountNumberWebsiteToCustomerAndAccountNo < ActiveRecord::Migration
  def up
    add_column :customer_and_account_nos, :company, :string
    add_column :customer_and_account_nos, :account_number, :string
    add_column :customer_and_account_nos, :website, :string

    populate_accounts

  end

  def down
    remove_column :customer_and_account_nos, :company
    remove_column :customer_and_account_nos, :account_number
    remove_column :customer_and_account_nos, :website
  end

  def populate_accounts
    CustomerAndAccountNo.all.each do |caa|
      temp = caa.name.split(' ')
      caa.update_attribute(:company, temp[0])
      caa.update_attribute(:account_number, temp[1].gsub(/[()]/, ''))
      caa.update_attribute(:website, "http://www.#{temp[0]}.com")
    end
  end
end
