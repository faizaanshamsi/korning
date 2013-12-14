class CustomerAndAccountNosController < ApplicationController

  def index
    @customer_and_account_nos = CustomerAndAccountNo.all
  end

  def show
    @customer_and_account_no = CustomerAndAccountNo.find(params[:id])
  end
end
